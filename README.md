# Meal Planner Backend

A Spring Boot backend for the Meal Planner application, providing REST APIs to manage dishes and tags, alongside an integrated AI assistant powered by Groq and LangChain4j.

## Features

- **Dishes & Tags Management**: Full CRUD REST APIs to organize your meals (e.g., categorizing dishes as 'Carne', 'Pescado', 'Verdura').
- **AI Chat Assistant**: An integrated AI endpoint that processes natural language requests, validates constraints, and returns strict JSON actions (e.g., adding meals to specific days of the week).
- **PostgreSQL Integration**: Relational database storage with automated schema migrations via Flyway.
- **Dockerized Ready**: Comes with a multi-stage Dockerfile and Docker Compose setup for easy 24/7 homeserver deployment.

## Prerequisites

- **Java 21+** (for local development)
- **PostgreSQL 15+** (if not using Docker)
- **Docker & Docker Compose** (for deployment)
- **Groq API Key** (for the AI features)

## Environment Variables

Create a `.env` file in the root of the project with the following variables. (Note: Never commit your `.env` file to version control).

```env
# Required for AI Chat
GROQ_API_KEY=your_groq_api_key_here

# Optional: Override Database URL when running locally without Docker Compose
# DB_URL=jdbc:postgresql://localhost:5432/menudb
```

## Local Development

1. Ensure a PostgreSQL instance is running locally on port `5432` with a database named `menudb` (user `admin`, password `1234`).
2. Clone the repository.
3. Run the application using the Gradle wrapper:

```bash
./gradlew bootRun
```
Flyway will automatically create the schema and populate the sample data on the first run. The server will start on `http://localhost:8080`.

## API Endpoints

### AI Chat
* `POST /api/chat` - Interact with the AI meal planner assistant. Expects a JSON payload with `message`, `context`, and `sessionId`.

### Dishes
* `GET /api/dishes` - List all dishes (eagerly fetches associated tags).
* `POST /api/dishes` - Create a new dish.
* `PUT /api/dishes/{id}` - Update a dish (name, description, tags).
* `DELETE /api/dishes/{id}` - Delete a dish.

### Tags (Labels)
* `GET /api/tags` - List all tags.
* `POST /api/tags` - Create a new tag.
* `PUT /api/tags/{id}` - Update a tag.
* `DELETE /api/tags/{id}` - Delete a tag.

## Docker Deployment (Homeserver)

The project includes a `docker-compose.yml` file that orchestrates both the Spring Boot backend and the PostgreSQL database, making it ideal for a 24/7 homeserver deployment.

1. Transfer the project directory to your homeserver.
2. Ensure your `.env` file is present in the project root.
3. Build and start the containers in detached mode:

```bash
docker-compose up -d --build
```

The database container uses a named volume (`postgres_data`) to ensure your data persists across container restarts. The `restart: unless-stopped` policy guarantees both services will boot automatically if the host server reboots.
