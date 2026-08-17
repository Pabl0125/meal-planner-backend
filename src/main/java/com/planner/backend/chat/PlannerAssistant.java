package com.planner.backend.chat;

import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import dev.langchain4j.model.chat.ChatLanguageModel;
import dev.langchain4j.service.AiServices;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;
import dev.langchain4j.service.MemoryId;
import org.springframework.stereotype.Service;

import jakarta.annotation.PostConstruct;

/**
 * @Service is a specialization of @Component. It signifies that this class holds business logic.
 * Spring Boot will automatically instantiate it and inject its dependencies.
 */
@Service
public class PlannerAssistant {

    private final ChatLanguageModel chatLanguageModel;
    private final PlannerAiTools tools;
    private Assistant assistant;

    /**
     * Dependency Injection via Constructor.
     * Spring Boot looks for Beans of type ChatLanguageModel and PlannerAiTools, and provides them here.
     */
    public PlannerAssistant(ChatLanguageModel chatLanguageModel, PlannerAiTools tools) {
        this.chatLanguageModel = chatLanguageModel;
        this.tools = tools;
    }

    /**
     * @PostConstruct tells Spring: "Execute this method automatically right after you create this Bean 
     * and inject all its dependencies."
     */
    @PostConstruct
    public void init() {
        this.assistant = AiServices.builder(Assistant.class)
                .chatLanguageModel(chatLanguageModel)
                .tools(tools)
                // We use chatMemoryProvider instead of a single chatMemory to give each user/session 
                // their own isolated memory state, preventing the "Singleton Memory Trap".
                .chatMemoryProvider(memoryId -> MessageWindowChatMemory.withMaxMessages(10)) 
                .build();
    }

    /**
     * Public method exposed to the controller to interact with the AI.
     */
    public String chat(String memoryId, String message, String context) {
        return assistant.chat(memoryId, message, context);
    }

    /**
     * A declarative interface defining how we talk to the AI.
     * LangChain4j magically implements this interface behind the scenes.
     */
    interface Assistant {
        /**
         * @SystemMessage sets the "System Prompt" - the core rules and identity of the AI.
         * The {{context}} placeholder gets replaced by the '@V("context")' variable below.
         */
        @SystemMessage({
            "You are a helpful meal planner assistant.",
            "You will answer all questions in spanish despite the language used by the user",
            "You can help the user organize their weekly meals.",
            "Use the available tools to modify the meal plan when the user requests it.",
            "The user's available dishes and current plan context: {{context}}",
        })
        /**
         * @MemoryId tells LangChain4j to use this parameter to look up the correct chat memory.
         * @UserMessage marks the parameter that contains the user's actual typed message.
         * @V maps the 'context' string to the {{context}} placeholder in the System Message.
         */
        String chat(@MemoryId String memoryId, @UserMessage String message, @V("context") String context);
    }
}
