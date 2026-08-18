package com.planner.backend.chat;

import dev.langchain4j.agent.tool.Tool;
import org.springframework.stereotype.Component;

/**
 * @Component makes this class a Spring Bean so it can be managed and injected.
 * 
 * PlannerAiTools contains the "Tools" (also known as function calls) that the AI model can execute.
 * When the AI detects that the user wants to change the meal plan, it doesn't just output text;
 * it calls one of these Java methods directly under the hood.
 */
@Component
public class PlannerAiTools {
    private final ActionContext actionContext;

    /**
     * Constructor injection: Spring Boot automatically passes the ActionContext Bean here.
     */
    public PlannerAiTools(ActionContext actionContext) {
        this.actionContext = actionContext;
    }

    /**
     * @Tool is a LangChain4j annotation. The description provided inside it is sent to the AI prompt.
     * The AI reads this description to understand exactly WHAT this method does and WHEN to call it.
     * It is very important that the description is detailed.
     */
    @Tool("Assigns a dish to a specific day and meal. Example: assignDishToMeal('Pasta', 'Monday', 'Lunch')")
    public String assignDishToMeal(String dishName, String day, String meal) {
        // Instead of modifying the database directly, we capture the AI's intent 
        // and store it in our ThreadLocal context so the frontend can execute it visually.
        actionContext.addAction(new AiAction("ASSIGN", day, meal, dishName, null, null, null));
        
        // This return string is fed back to the AI model so it knows the method succeeded.
        return "Successfully assigned " + dishName + " to " + day + " " + meal;
    }
    
    @Tool("Clears the meal plan for a specific day and meal. Example: clearMeal('Monday', 'Lunch')")
    public String clearMeal(String day, String meal) {
        actionContext.addAction(new AiAction("CLEAR_MEAL", day, meal, null, null, null, null));
        return "Successfully cleared " + day + " " + meal;
    }
    
    @Tool("Clears the entire weekly meal plan.")
    public String clearWeek() {
        actionContext.addAction(new AiAction("CLEAR_WEEK", null, null, null, null, null, null));
        return "Successfully cleared the whole week.";
    }
}
