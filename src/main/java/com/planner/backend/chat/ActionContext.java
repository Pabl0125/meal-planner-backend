package com.planner.backend.chat;

import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

/**
 * @Component: This annotation tells Spring Boot to automatically create an instance (a "Bean")
 * of this class and manage it in its Application Context. This allows us to inject it anywhere using constructors.
 * 
 * ActionContext is a specialized class designed to hold the 'actions' that the AI decides to take.
 * Since a Spring @Component is typically a Singleton (only one instance for the entire app), 
 * we must handle concurrent requests carefully.
 */
@Component
public class ActionContext {
    /**
     * ThreadLocal is used here to ensure that each incoming HTTP request thread has its own separate, 
     * isolated list of actions. This prevents actions from User A's chat request bleeding into User B's chat request.
     */
    private static final ThreadLocal<List<AiAction>> actions = ThreadLocal.withInitial(ArrayList::new);

    /**
     * Adds an action to the current thread's list.
     */
    public void addAction(AiAction action) {
        actions.get().add(action);
    }

    /**
     * Retrieves a copy of the current thread's actions.
     */
    public List<AiAction> getActions() {
        return new ArrayList<>(actions.get());
    }

    /**
     * Clears the current thread's actions. This is CRUCIAL to prevent memory leaks 
     * and accidental reuse of old actions if Tomcat reuses the thread for a new request.
     */
    public void clear() {
        actions.remove();
    }
}
