package com.planner.backend.chat;

import org.springframework.web.bind.annotation.*;

/**
 * @RestController: Combines @Controller and @ResponseBody. 
 * This tells Spring that this class handles HTTP requests, and the returned objects 
 * should be automatically serialized into JSON and sent in the HTTP response body.
 *
 * @RequestMapping("/api/chat"): Sets the base URL path. All endpoints in this class will start with /api/chat.
 *
 * @CrossOrigin(origins = "*"): Enables Cross-Origin Resource Sharing (CORS). 
 * This allows a frontend running on a different port (like localhost:3000) to make requests 
 * to this backend (localhost:8080) without the browser blocking it for security reasons.
 */
@RestController
@RequestMapping("/api/chat")
public class ChatController {
    
    private final PlannerAssistant plannerAssistant;

    /**
     * Constructor Dependency Injection: Spring provides instances of PlannerAssistant.
     */
    public ChatController(PlannerAssistant plannerAssistant) {
        this.plannerAssistant = plannerAssistant;
    }

    /**
     * @PostMapping maps HTTP POST requests hitting "/api/chat" to this method.
     * @RequestBody tells Spring to read the incoming JSON payload and deserialize it into our ChatRequest Java Record.
     */
    @PostMapping
    public ChatResponse chat(@RequestBody ChatRequest request) {
        // 1. Prepare the context and session. If the frontend didn't send any, provide fallbacks.
        String context = request.context() != null ? request.context() : "No context provided.";
        String sessionId = request.sessionId() != null ? request.sessionId() : "default-user";
        
        // 2. Send the message and context to our AI Assistant.
        String responseText = plannerAssistant.chat(sessionId, request.message(), context);
        
        // 3. Since we instructed the AI to return a JSON string directly, we parse it into our ChatResponse record.
        try {
            com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
            return mapper.readValue(responseText, ChatResponse.class);
        } catch (Exception e) {
            // Fallback just in case the AI failed to generate valid JSON
            return new ChatResponse(responseText, java.util.Collections.emptyList());
        }
    }
}
