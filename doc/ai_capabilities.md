# AI Integration Capabilities

This document details the capabilities and technical implementation of the AI Assistant integrated into the Meal Planner Backend.

## Overview
The AI assistant is powered by **Groq** (using the `openai/gpt-oss-20b` or similar model via LangChain4j). It acts as a conversational meal planner that returns strictly formatted JSON instructions to allow the frontend application to automatically execute user requests.

## Technical Architecture
- **Provider**: Groq API (using `OpenAiChatModel` adapter)
- **Format**: Forced `json_object` mode ensures the AI never returns pure markdown text, but rather a parsable JSON structure.
- **Memory**: Session-isolated chat memory using `@MemoryId`. Each frontend user gets a unique memory window (capped at 10 messages) to maintain conversational context without leaking data between sessions.

## JSON Response Structure
The model is strictly instructed to return the following JSON schema:
```json
{
  "text": "A friendly conversational response in Spanish.",
  "actions": [
    {
      "type": "ACTION_TYPE",
      "day": "Day of the week (if applicable)",
      "meal": "Lunch or Dinner (if applicable)",
      "dishName": "Name of the dish (if applicable)",
      "description": "Description of the dish (if applicable)",
      "tags": ["Array", "of", "tags"],
      "id": 123
    }
  ]
}
```

## Supported Actions
The AI translates natural language requests into concrete actions for the frontend to execute. The current implementation supports **9 distinct actions**:

### 📅 Calendar Planning Actions
* `ASSIGN`: Schedules a specific dish for a specific day (`Lunes` to `Domingo`) and meal (`Lunch` or `Dinner`).
* `CLEAR_MEAL`: Empties a single specific slot in the calendar.
* `CLEAR_WEEK`: Erases all meals from the entire weekly planner.

### 🍲 Dish Database Actions
* `CREATE_DISH`: Instructs the system to create a new dish, including its description and tags.
* `EDIT_DISH`: Instructs the system to modify an existing dish (requires the dish's numerical `id`).
* `DELETE_DISH`: Instructs the system to remove a dish (requires the dish's numerical `id`).

### 🏷️ Tag Database Actions
* `CREATE_TAG`: Instructs the system to create a new category label.
* `EDIT_TAG`: Instructs the system to rename a label (requires the tag's numerical `id`).
* `DELETE_TAG`: Instructs the system to remove a label (requires the tag's numerical `id`).

## Nutritional Guidelines
The AI's system prompt includes strict dietary constraints to ensure healthy meal planning. It will attempt to balance the user's diet based on the following rules:
- **Vegetables**: 1-2 servings/day
- **Fruits**: 1-3 servings/day
- **Fish**: 2-4 servings/week (balancing white and blue fish)
- **Meat**: Limiting red meat to <2 servings/week
- **Eggs/Dairy/Nuts**: Appropriate weekly distributions as specified in the prompt.

*Note: The backend simply passes the AI's JSON commands to the frontend. The frontend application is responsible for detecting these `actions` and making the corresponding `POST/PUT/DELETE` API calls to mutate the database.*
