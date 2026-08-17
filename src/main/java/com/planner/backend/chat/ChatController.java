package com.planner.backend.chat;

import org.springframework.web.bind.annotation.*;

/**
 * @RestController: Combines @Controller and @ResponseBody. 
 * This tells Spring that this class handles HTTP requests, and the returned objects 
 * should be automatically serialized into JSON and sent in the HTTP response body.
 *
 * @RequestMapping("/api/chat"): Sets the base URL path. All endpoints in this class will start with /api/chat.
 *
 * @CrossOrigin(origins = "*"): Enables Cross-Origin Resource Sharing (CORS). 
 * This allows a frontend running on a different port (like localhost:3000) to make requests 
 * to this backend (localhost:8080) without the browser blocking it for security reasons.
 */
@RestController
@RequestMapping("/api/chat")
@CrossOrigin(origins = "*")
public class ChatController {
    
    private final PlannerAssistant plannerAssistant;
    private final ActionContext actionContext;

    /**
     * Constructor Dependency Injection: Spring provides instances of PlannerAssistant and ActionContext.
     */
    public ChatController(PlannerAssistant plannerAssistant, ActionContext actionContext) {
        this.plannerAssistant = plannerAssistant;
        this.actionContext = actionContext;
    }

    /**
     * @PostMapping maps HTTP POST requests hitting "/api/chat" to this method.
     * @RequestBody tells Spring to read the incoming JSON payload and deserialize it into our ChatRequest Java Record.
     */
    @PostMapping
    public ChatResponse chat(@RequestBody ChatRequest request) {
        try {
            // 1. Clear any old leftover actions in the current thread just in case.
            actionContext.clear();
            
            // 2. Prepare the context and session. If the frontend didn't send any, provide fallbacks.
            String context = request.context() != null ? request.context() : "No context provided.";
            String sessionId = request.sessionId() != null ? request.sessionId() : "default-user";
            
            // 3. Send the message and context to our AI Assistant.
            // This is a blocking call: it waits for Gemini to process the text and optionally call tools.
            String responseText = plannerAssistant.chat(sessionId, request.message(), context);
            
            // 4. Create and return the final ChatResponse containing both the AI text and any captured actions.
            return new ChatResponse(responseText, actionContext.getActions());
            
        } finally {
            // 5. Always clean up the ThreadLocal variable to prevent memory leaks in the Tomcat server.
            actionContext.clear();
        }
    }
}
