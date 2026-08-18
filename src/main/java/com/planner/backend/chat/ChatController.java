package com.planner.backend.chat;

import com.planner.backend.model.Dish;
import com.planner.backend.model.Tag;
import com.planner.backend.repository.TagRepository;
import com.planner.backend.service.DishService;
import com.planner.backend.service.TagService;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @RestController: Combines @Controller and @ResponseBody.
 * This tells Spring that this class handles HTTP requests, and the returned objects
 * should be automatically serialized into JSON and sent in the HTTP response body.
 *
 * @RequestMapping("/api/chat"): Sets the base URL path. All endpoints in this class will start with /api/chat.
 */
@RestController
@RequestMapping("/api/chat")
public class ChatController {

    private final PlannerAssistant plannerAssistant;
    private final DishService dishService;
    private final TagService tagService;
    private final TagRepository tagRepository;

    // Límite de caracteres del contexto para no superar los límites de tokens de la API de IA
    private static final int MAX_CONTEXT_CHARS = 3000;

    /**
     * Constructor Dependency Injection: Spring provides instances of all required beans.
     */
    public ChatController(PlannerAssistant plannerAssistant,
                          DishService dishService,
                          TagService tagService,
                          TagRepository tagRepository) {
        this.plannerAssistant = plannerAssistant;
        this.dishService = dishService;
        this.tagService = tagService;
        this.tagRepository = tagRepository;
    }

    /**
     * @PostMapping maps HTTP POST requests hitting "/api/chat" to this method.
     * @RequestBody tells Spring to read the incoming JSON payload and deserialize it into our ChatRequest Java Record.
     *
     * Flow:
     *  1. Send user message + context to AI.
     *  2. Parse AI's JSON response.
     *  3. Execute any DB-modifying actions (CREATE/EDIT/DELETE dish or tag) server-side.
     *  4. Return the full response (text + actions) to the frontend.
     *     Planner actions (ASSIGN, CLEAR_MEAL, CLEAR_WEEK) are still handled by the frontend.
     */
    @PostMapping
    public ChatResponse chat(@RequestBody ChatRequest request) {
        // 1. Prepare the context and session. If the frontend didn't send any, provide fallbacks.
        String rawContext = request.context() != null ? request.context() : "No context provided.";
        // Truncate context to avoid request_too_large errors when the frontend sends all dishes
        String context = rawContext.length() > MAX_CONTEXT_CHARS
                ? rawContext.substring(0, MAX_CONTEXT_CHARS) + "... [truncated]"
                : rawContext;
        String sessionId = request.sessionId() != null ? request.sessionId() : "default-user";

        // 2. Send the message and context to our AI Assistant.
        String responseText = plannerAssistant.chat(sessionId, request.message(), context);

        // 3. Parse the AI response JSON into our ChatResponse record.
        ChatResponse chatResponse;
        try {
            com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
            chatResponse = mapper.readValue(responseText, ChatResponse.class);
        } catch (Exception e) {
            // Fallback just in case the AI failed to generate valid JSON
            return new ChatResponse(responseText, java.util.Collections.emptyList());
        }

        // 4. Execute any DB-modifying actions returned by the AI.
        if (chatResponse.actions() != null) {
            for (AiAction action : chatResponse.actions()) {
                executeDbAction(action);
            }
        }

        return chatResponse;
    }

    /**
     * Executes database-modifying AI actions server-side.
     * Planner actions (ASSIGN, CLEAR_MEAL, CLEAR_WEEK) are intentionally skipped here —
     * they manage frontend UI state and are handled by the React client.
     */
    private void executeDbAction(AiAction action) {
        if (action.type() == null) return;

        switch (action.type()) {
            case "CREATE_DISH" -> {
                Dish dish = new Dish();
                dish.setName(action.dishName());
                dish.setDescription(action.description());
                dish.setTags(resolveTagsByName(action.tags()));
                dishService.saveDish(dish);
            }
            case "EDIT_DISH" -> {
                if (action.id() == null) break;
                Dish updatedDish = new Dish();
                updatedDish.setName(action.dishName());
                updatedDish.setDescription(action.description());
                updatedDish.setTags(resolveTagsByName(action.tags()));
                dishService.updateDish(action.id(), updatedDish);
            }
            case "DELETE_DISH" -> {
                if (action.id() == null) break;
                dishService.deleteDish(action.id());
            }
            case "CREATE_TAG" -> {
                Tag tag = new Tag();
                tag.setName(action.dishName()); // AI uses dishName field for the tag name
                tagService.saveTag(tag);
            }
            case "EDIT_TAG" -> {
                if (action.id() == null) break;
                Tag updatedTag = new Tag();
                updatedTag.setName(action.dishName()); // AI uses dishName field for the tag name
                tagService.updateTag(action.id(), updatedTag);
            }
            case "DELETE_TAG" -> {
                if (action.id() == null) break;
                tagService.deleteTag(action.id());
            }
            // ASSIGN, CLEAR_MEAL, CLEAR_WEEK → handled by the frontend, no DB action needed
            default -> { /* no-op */ }
        }
    }

    /**
     * Resolves a list of tag name strings from the AI into Tag entities.
     * If a tag with the given name already exists in the DB, it reuses it.
     * If it doesn't exist, it creates a new one automatically.
     */
    private Set<Tag> resolveTagsByName(List<String> tagNames) {
        Set<Tag> resolved = new HashSet<>();
        if (tagNames == null || tagNames.isEmpty()) return resolved;

        for (String name : tagNames) {
            if (name == null || name.isBlank()) continue;
            // Reutiliza la etiqueta existente o crea una nueva si no existe
            Tag tag = tagRepository.findByNameIgnoreCase(name.trim())
                    .orElseGet(() -> {
                        Tag newTag = new Tag();
                        newTag.setName(name.trim());
                        return tagRepository.save(newTag);
                    });
            resolved.add(tag);
        }
        return resolved;
    }
}
