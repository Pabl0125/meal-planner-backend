# Implementation Plan: Interactive AI Planner Assistant

## Overview
Integrate an interactive AI assistant into the meal planner. The AI will not only converse with the user but also have the ability to manipulate the meal plan board directly (e.g., assigning dishes, clearing days) using LLM function calling (tools) via the Vercel AI SDK.

## Requirements
- A chat interface (e.g., floating widget or sidebar) accessible from the planner dashboard.
- The AI must have context of the user's available dishes and current weekly plan.
- The AI must be able to perform actions: assign a dish to a specific day/meal, clear a meal, or clear the whole week.
- Secure API key management (all LLM calls happen server-side).

## Architecture Review & Options

Dado que tenemos acceso y control total sobre el **backend en Spring Boot**, tenemos opciones mucho más robustas. La lógica de la IA y las claves de la API deben residir en el backend.

1. **Proxy en Next.js (Descartado):** Usar `app/api/chat` en Next.js. Ya que tenemos un backend dedicado en Java, no tiene sentido fragmentar la lógica de negocio ni la seguridad en dos servidores distintos.

2. **Backend LLM con Retorno de Acciones (Recomendado):**
    - El frontend envía un POST al backend de Spring Boot con el mensaje del usuario y el contexto mínimo necesario (ej. platos disponibles si no los consulta el backend directamente, y el estado del menú si no está persistido).
    - El backend en Spring Boot utiliza una librería como **Spring AI** o **LangChain4j**.
    - El backend configura las "Herramientas" (Tools/Functions) en Java. Si la IA decide modificar el menú, el backend captura esa intención.
    - El backend responde al frontend con un formato estructurado (ej. SSE/Streaming o JSON) que incluye el texto de respuesta de la IA y un array de **acciones a ejecutar** (ej. `[{ "type": "ASSIGN", "day": "Lunes", "meal": "Lunch", "dishId": 5 }]`).
    - El frontend recibe la respuesta, muestra el mensaje de chat y ejecuta las acciones actualizando su estado local de React (`setPlan`).

**Decisión:** Procederemos con la **Opción 2**, centralizando el cerebro de la IA en Spring Boot y delegando al frontend únicamente la renderización y la ejecución visual de las órdenes.

## Architecture Changes
- **Backend (Spring Boot):**
    - Añadir dependencia de `Spring AI` o `LangChain4j`.
    - Crear un nuevo controlador `@RestController` (ej. `/api/chat`).
    - Implementar un servicio de IA que reciba mensajes, mantenga historial (opcional) y exponga las funciones (Tools) al LLM.
- **Frontend (React/Next.js):**
    - Componente `AiChatWidget` para la interfaz.
    - Lógica para parsear la respuesta del backend y despachar actualizaciones al estado (`setPlan`, `setDishes`).

## Implementation Steps

### Phase 1: Backend AI Setup (Spring Boot)
1. **Configurar Dependencias y API Key**
    - Acción: Añadir Spring AI (o LangChain4j) al `pom.xml` / `build.gradle`. Añadir la clave de OpenAI al `application.properties`.
    - Por qué: Habilita la conexión con el LLM desde el servidor seguro.

2. **Definir el Servicio y las Herramientas (Tools)**
    - Acción: Crear un servicio que construya el prompt del sistema. Usar anotaciones (ej. `@FunctionCall` o `@Tool`) para definir los métodos que el LLM puede invocar, como `assignDishToMeal(String dishName, String day, String meal)`.
    - Riesgo: Medio (Asegurar que el LLM entiende exactamente los formatos de días y comidas esperados).

3. **Crear el Endpoint de Chat**
    - Acción: Crear un `ChatController` con un endpoint `POST /api/chat`. Este endpoint debe devolver tanto la respuesta de texto de la IA como cualquier acción que el LLM haya decidido invocar. Si usamos *streaming*, se puede usar `Server-Sent Events (SSE)`.

### Phase 2: Frontend Chat Interface
4. **Crear Componente AI Chat** (File: `components/planner/ai-chat-widget.tsx`)
    - Acción: Construir una ventana de chat flotante. Implementar un hook para manejar el estado de los mensajes localmente o conectar por SSE.
    - Por qué: Interfaz para el usuario.

### Phase 3: Sincronización y Ejecución
5. **Conectar Frontend con Backend** (File: `components/planner/ai-chat-widget.tsx`)
    - Acción: Modificar el envío del chat para apuntar al endpoint de Spring Boot.
    - Dependencias: El endpoint de la Fase 1 debe estar levantado.

6. **Ejecutor de Acciones en React**
    - Acción: Cuando el backend responda con un bloque de acción (ej. `{"action": "ADD_DISH", "payload": {...}}`), el frontend buscará el plato en su estado `dishes` local y llamará a `setPlan` para actualizar el tablero en tiempo real.
    - Riesgo: Alto (El frontend debe manejar posibles errores si la IA devuelve una acción con parámetros inválidos).

## Testing Strategy
- **Backend Unit Tests:** Probar que el prompt envía las tools correctas y parsear la respuesta simulada del LLM.
- **Frontend Integration:** Simular la respuesta del backend con acciones y verificar que el `WeeklyPlan` se actualiza.

## Risks & Mitigations
- **Riesgo**: Latencia si no se usa streaming (el usuario espera varios segundos a que la IA procese la orden).
    - **Mitigación**: Implementar SSE (Server-Sent Events) en Spring Boot para que el texto aparezca letra a letra mientras la IA genera la respuesta.
- **Riesgo**: Desincronización del contexto. El backend podría no saber qué platos exactos tiene el usuario en pantalla.
    - **Mitigación**: El frontend puede incluir un pequeño resumen del estado actual (platos disponibles) en el payload del POST inicial de cada mensaje.

## Success Criteria
- [ ] Endpoint de Spring Boot operativo y comunicándose con OpenAI.
- [ ] Frontend renderiza widget de chat.
- [ ] Órdenes del lenguaje natural (ej. "Pon pollo el lunes") retornan una acción estructurada desde Java.
- [ ] Frontend lee la acción estructurada y actualiza el estado de la UI instantáneamente.
