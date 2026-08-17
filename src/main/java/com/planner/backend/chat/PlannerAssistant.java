package com.planner.backend.chat;

import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import dev.langchain4j.model.chat.ChatLanguageModel;
import dev.langchain4j.service.AiServices;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;
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
     * 
     * Here, we use LangChain4j's AiServices builder to dynamically create a proxy implementation 
     * of our 'Assistant' interface, wiring it up with the Gemini LLM, our custom tools, and a chat memory.
     */
    @PostConstruct
    public void init() {
        this.assistant = AiServices.builder(Assistant.class)
                .chatLanguageModel(chatLanguageModel)
                .tools(tools)
                // Chat memory remembers the last 10 messages of the conversation for context.
                .chatMemory(MessageWindowChatMemory.withMaxMessages(10)) 
                .build();
    }

    /**
     * Public method exposed to the controller to interact with the AI.
     */
    public String chat(String message, String context) {
        return assistant.chat(message, context);
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
            "You can help the user organize their weekly meals.",
            "Use the available tools to modify the meal plan when the user requests it.",
            "The user's available dishes and current plan context: {{context}}"
        })
        /**
         * @UserMessage marks the parameter that contains the user's actual typed message.
         * @V maps the 'context' string to the {{context}} placeholder in the System Message.
         */
        String chat(@UserMessage String message, @V("context") String context);
    }
}
