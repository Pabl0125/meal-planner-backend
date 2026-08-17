package com.planner.backend.chat;

/**
 * A Java Record that represents an action the AI decided to execute.
 * Records are a concise way to create immutable data carriers in Java.
 * The compiler automatically generates constructors, getters, equals, hashcode, and toString methods.
 * 
 * This object will be converted to JSON and sent back to the frontend.
 * 
 * @param type     The type of action (e.g., "ASSIGN", "CLEAR_MEAL", "CLEAR_WEEK")
 * @param day      The day of the week the action applies to
 * @param meal     The specific meal (e.g., "Breakfast", "Lunch", "Dinner")
 * @param dishName The name of the dish being assigned (can be null for clear actions)
 */
public record AiAction(String type, String day, String meal, String dishName) {}
