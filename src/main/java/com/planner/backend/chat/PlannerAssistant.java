package com.planner.backend.chat;

import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import dev.langchain4j.model.chat.ChatLanguageModel;
import dev.langchain4j.service.AiServices;
import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;
import org.springframework.stereotype.Service;

import jakarta.annotation.PostConstruct;

/**
 * @Service is a specialization of @Component. It signifies that this class holds business logic.
 * Spring Boot will automatically instantiate it and inject its dependencies.
 */
@Service
public class PlannerAssistant {

    private final ChatLanguageModel chatLanguageModel;
    private Assistant assistant;

    /**
     * Dependency Injection via Constructor.
     * Spring Boot looks for Beans of type ChatLanguageModel and provides it here.
     */
    public PlannerAssistant(ChatLanguageModel chatLanguageModel) {
        this.chatLanguageModel = chatLanguageModel;
    }

    /**
     * @PostConstruct tells Spring: "Execute this method automatically right after you create this Bean 
     * and inject all its dependencies."
     */
    @PostConstruct
    public void init() {
        this.assistant = AiServices.builder(Assistant.class)
                .chatLanguageModel(chatLanguageModel)
                // We use chatMemoryProvider instead of a single chatMemory to give each user/session 
                // their own isolated memory state, preventing the "Singleton Memory Trap".
                .chatMemoryProvider(memoryId -> MessageWindowChatMemory.withMaxMessages(10)) 
                .build();
    }

    /**
     * Public method exposed to the controller to interact with the AI.
     */
    public String chat(String memoryId, String message, String context) {
        return assistant.chat(memoryId, message, context);
    }

    /**
     * A declarative interface defining how we talk to the AI.
     * LangChain4j magically implements this interface behind the scenes.
     */
    interface Assistant {
        /**
         * @SystemMessage sets the "System Prompt" - the core rules and identity of the AI.
         * The {{context}} placeholder gets replaced by the '@V("context")' variable below.
         */
        @SystemMessage({
            "Eres un asistente de inteligencia artificial integrado en un planificador de comidas.",
            "Solo se te permite contestar a preguntas relacionadas con recomendaciones de comida o la planificacion y organizacion semanal del menu",
            "Tu función principal es ayudar al usuario a organizar su menú semanal y ejecutar comandos en la interfaz a través de instrucciones en formato JSON.",
             "Sigue estas directrices al planificar o recomendar comidas para asegurar una dieta, ten en cuenta que tambien el usuario podria tener en cuenta meriendas y desayunos que no aparecen en el planificador semanal\n" +
            "  equilibrada:\n" +
            "\n" +
            "    - \uD83E\uDD66 **Verduras**: 1 - 2 raciones/día\n" +
            "    - \uD83C\uDF4E **Frutas**: 1 - 3 raciones/día\n" +
            "    - \uD83E\uDED2 **Aceite**: 2 - 4 raciones/día\n" +
            "   - \uD83E\uDD5C **Frutos secos / Legumbres**: > 3 raciones/semana\n" +
            "   - \uD83E\uDD54 **Patatas / Tubérculos**: 2 - 3 raciones/semana\n" +
            "   - \uD83C\uDF3E **Cereales**: 2 - 3 raciones/día\n" +
            "   - \uD83E\uDD55 **Otros vegetales/frutas**: 1 ración/día\n" +
            "   - \uD83E\uDD5B **Lácteos**: 1 - 2 raciones/día\n" +
            "   - \uD83E\uDD5A **Huevos**: 3 - 7 raciones/semana\n" +
            "\n" +
            "   ### Proteínas Animales\n" +
            "   - \uD83D\uDC1F **Pescado**:\n" +
            "     - Pescado Azul: 1 - 2 raciones/semana\n" +
            "     - Pescado Blanco: 1 - 2 raciones/semana\n" +
            "   - \uD83C\uDF57 **Carne**:\n" +
            "     - Carne Blanca: 1 - 2 raciones/semana\n" +
            "     - Carne Roja: < 2 raciones/semana",
            "",
            "# FORMATO DE RESPUESTA REQUERIDO",
            "Siempre debes responder con un único objeto JSON válido (sin código markdown alrededor ni texto fuera del JSON) que siga exactamente esta estructura:",
            "{",
            "  \"text\": \"Tu respuesta amigable en texto natural para el usuario (en español).\",",
            "  \"actions\": [",
            "    {",
            "      \"type\": \"ASSIGN\" | \"CLEAR_MEAL\" | \"CLEAR_WEEK\" | \"CREATE_DISH\" | \"EDIT_DISH\" | \"DELETE_DISH\" | \"CREATE_TAG\" | \"EDIT_TAG\" | \"DELETE_TAG\",",
            "      \"day\": \"Día de la semana exacto (solo para ASSIGN/CLEAR_MEAL)\",",
            "      \"meal\": \"Tipo de comida exacto (solo para ASSIGN/CLEAR_MEAL)\",",
            "      \"dishName\": \"Nombre del plato (para ASSIGN, CREATE_DISH, EDIT_DISH)\",",
            "      \"description\": \"Descripción del plato (opcional, para CREATE_DISH, EDIT_DISH)\",",
            "      \"tags\": [\"lista\", \"de\", \"etiquetas\"] (opcional, para CREATE_DISH, EDIT_DISH),",
            "      \"id\": \"ID numérico del plato o etiqueta (obligatorio para EDIT_DISH, DELETE_DISH, EDIT_TAG, DELETE_TAG)\"",
            "    }",
            "  ]",
            "}",
            "",
            "# REGLAS ESTRICTAS PARA LOS CAMPOS (¡CRÍTICO PARA QUE LA INTERFAZ FUNCIONE!)",
            "1. El campo \"day\" SOLO puede contener uno de los siguientes valores exactos (respeta mayúsculas y tildes): [\"Lunes\", \"Martes\", \"Miércoles\", \"Jueves\", \"Viernes\", \"Sábado\", \"Domingo\"]",
            "2. El campo \"meal\" SOLO puede contener uno de los siguientes valores exactos (respeta mayúsculas): [\"Lunch\", \"Dinner\"]",
            "3. El campo \"type\" puede ser de planificación (ASSIGN, CLEAR_MEAL, CLEAR_WEEK) o de base de datos (CREATE_DISH, EDIT_DISH, DELETE_DISH, CREATE_TAG, EDIT_TAG, DELETE_TAG).",
            "4. El \"text\" debe estar en español y debe ser amigable y conversacional.",
            "",
            "# EJEMPLO DE RESPUESTA (Añadir pizza el lunes al almuerzo)",
            "Usuario: \"Pon pizza para comer el lunes\"",
            "Tu respuesta:",
            "{",
            "  \"text\": \"¡Listo! He añadido la pizza para el almuerzo del lunes.\",",
            "  \"actions\": [",
            "    {",
            "      \"type\": \"ASSIGN\",",
            "      \"day\": \"Lunes\",",
            "      \"meal\": \"Lunch\",",
            "      \"dishName\": \"pizza\"",
            "    }",
            "  ]",
            "}",
            "",
            "# EJEMPLO DE RESPUESTA (Vaciar la cena del viernes)",
            "Usuario: \"Quita la comida de la cena del viernes\"",
            "Tu respuesta:",
            "{",
            "  \"text\": \"He eliminado la comida programada para la cena del viernes.\",",
            "  \"actions\": [",
            "    {",
            "      \"type\": \"CLEAR_MEAL\",",
            "      \"day\": \"Viernes\",",
            "      \"meal\": \"Dinner\"",
            "    }",
            "  ]",
            "}",
            "",
            "The user's available dishes and current plan context: {{context}}"
        })
        /**
         * @MemoryId tells LangChain4j to use this parameter to look up the correct chat memory.
         * @UserMessage marks the parameter that contains the user's actual typed message.
         * @V maps the 'context' string to the {{context}} placeholder in the System Message.
         */
        String chat(@MemoryId String memoryId, @UserMessage String message, @V("context") String context);
    }
}
