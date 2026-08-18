package com.planner.backend.chat;

import dev.langchain4j.model.chat.ChatLanguageModel;
import dev.langchain4j.model.openai.OpenAiChatModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Configuration tells Spring Boot that this class contains Bean definitions.
 */
@Configuration
public class AiConfig {

    @Value("${groq.api-key}")
    private String apiKey;

    @Bean
    public ChatLanguageModel chatLanguageModel() {
        String finalKey = apiKey;
        // Bulletproof fallback to manually read .env if Spring doesn't inject it properly
        if ("demo".equals(finalKey)) {
            try {
                String envContent = java.nio.file.Files.readString(java.nio.file.Path.of(".env"));
                for (String line : envContent.split("\n")) {
                    if (line.startsWith("GROQ_API_KEY=")) {
                        finalKey = line.substring("GROQ_API_KEY=".length()).trim();
                    }
                }
            } catch (Exception e) {
                // Ignore and fallback
            }
        }

        return OpenAiChatModel.builder()
                .apiKey(finalKey)
                .baseUrl("https://api.groq.com/openai/v1")
                .modelName("groq/compound") // Groq's native compound chat model - best for agentic tasks
                .responseFormat("json_object") // Force Groq to return ONLY valid JSON
                .maxTokens(1024) // Raised from 400 - compound has more generous rate limits
                .build();
    }
}
