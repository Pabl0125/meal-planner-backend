package com.planner.backend.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import dev.ai4j.openai4j.OpenAiHttpException;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class GlobalExceptionHandler {

    // Maneja errores de la API de Inteligencia Artificial (Groq/OpenAI)
    @ExceptionHandler(OpenAiHttpException.class)
    public ResponseEntity<Map<String, String>> handleAiExceptions(OpenAiHttpException ex) {
        Map<String, String> response = new HashMap<>();
        
        if (ex.getMessage().contains("rate_limit_exceeded") || ex.getMessage().contains("Too Many Requests")) {
            response.put("error", "AI_RATE_LIMIT");
            response.put("message", "Has superado el límite de peticiones de la IA. Por favor, espera un momento.");
            return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).body(response); // 429
        }
        
        response.put("error", "AI_SERVICE_ERROR");
        response.put("message", "Error de comunicación con la IA: " + ex.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(response); // 502
    }

    // Maneja errores de validación y lógica de negocio (ej. plato no encontrado)
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<Map<String, String>> handleIllegalArgument(IllegalArgumentException ex) {
        Map<String, String> response = new HashMap<>();
        response.put("error", "BAD_REQUEST");
        response.put("message", ex.getMessage());
        
        if (ex.getMessage().contains("not found")) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response); // 404
        }
        
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response); // 400
    }

    // Maneja cualquier otro error inesperado (fallback)
    // LangChain4j wraps OpenAiHttpException inside RuntimeException, so we must
    // walk the cause chain to detect rate-limit or AI errors that would otherwise
    // always surface as a generic 500.
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, String>> handleGenericException(Exception ex) {
        ex.printStackTrace(); // Log full stacktrace to console for easy debugging

        // Walk the cause chain looking for an OpenAiHttpException
        Throwable cause = ex;
        while (cause != null) {
            if (cause instanceof OpenAiHttpException aiEx) {
                return handleAiExceptions(aiEx);
            }
            cause = cause.getCause();
        }

        // Also check the full message for rate-limit keywords in case the exception
        // type was lost but the message was preserved
        String fullMessage = ex.getMessage() != null ? ex.getMessage() : "";
        if (fullMessage.contains("rate_limit_exceeded") || fullMessage.contains("Too Many Requests")) {
            Map<String, String> response = new HashMap<>();
            response.put("error", "AI_RATE_LIMIT");
            response.put("message", "Has superado el límite de peticiones de la IA. Por favor, espera un momento.");
            return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).body(response); // 429
        }

        Map<String, String> response = new HashMap<>();
        response.put("error", "INTERNAL_SERVER_ERROR");
        response.put("message", fullMessage.isEmpty() ? "Ocurrió un error inesperado en el servidor." : fullMessage);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response); // 500
    }
}
