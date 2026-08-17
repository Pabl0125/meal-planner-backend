package com.planner.backend.chat;

import dev.langchain4j.model.chat.ChatLanguageModel;
import dev.langchain4j.model.googleai.GoogleAiGeminiChatModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Configuration tells Spring Boot that this class contains Bean definitions.
 * It runs during application startup to configure various components.
 */
@Configuration
public class AiConfig {

    /**
     * @Value tells Spring to look into application.properties (or environment variables)
     * and inject the value of "gemini.api-key" into this variable.
     */
    @Value("${gemini.api-key}")
    private String apiKey;

    /**
     * @Bean indicates that the object returned by this method should be registered
     * in the Spring Application Context. Other components (like PlannerAssistant) 
     * can then request a 'ChatLanguageModel' and Spring will give them this instance.
     */
    @Bean
    public ChatLanguageModel chatLanguageModel() {
        // We use LangChain4j's builder pattern to create and configure the Gemini Chat Model.
        // It connects to the Google AI API using the provided key.
        return GoogleAiGeminiChatModel.builder()
                .apiKey(apiKey)
                .modelName("gemini-1.5-flash") // The specific Gemini model we want to use. 'flash' is fast and efficient.
                .build();
    }
}
