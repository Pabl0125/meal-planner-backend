package com.planner.backend.chat;

/**
 * A Java Record that represents the incoming chat request from the user/frontend.
 * 
 * @param message The actual chat message typed by the user (e.g., "Assign pasta for Monday dinner")
 * @param context Additional contextual information sent by the frontend (like available dishes or current plan state)
 *                This helps the AI know what dishes exist without needing extra database queries.
 */
public record ChatRequest(String message, String context) {}
