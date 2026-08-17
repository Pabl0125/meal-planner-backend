package com.planner.backend.chat;

/**
 * A Java Record that represents the incoming chat request from the user/frontend.
 * 
 * @param message The actual chat message typed by the user (e.g., "Assign pasta for Monday dinner")
 * @param context Additional contextual information sent by the frontend (like available dishes or current plan state)
 * @param sessionId An optional unique identifier for the user's session to keep their chat memory separate.
 */
public record ChatRequest(String message, String context, String sessionId) {}
