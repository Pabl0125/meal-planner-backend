# Etapa 1: Compilación (Builder)
FROM gradle:8.5-jdk21 AS builder
WORKDIR /app

# Copiamos solo los archivos de configuración primero (aprovecha la caché de Docker)
COPY build.gradle.kts settings.gradle.kts ./
COPY gradle ./gradle
COPY gradlew ./

# Copiamos el código fuente
COPY src ./src

# Compilamos el proyecto (sin ejecutar tests para mayor velocidad)
RUN ./gradlew bootJar -x test

# Etapa 2: Imagen final ligera para producción
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copiamos el .jar generado en la etapa anterior
COPY --from=builder /app/build/libs/*.jar app.jar

# Exponemos el puerto de Spring Boot
EXPOSE 8080

# Comando para ejecutar la app
ENTRYPOINT ["java", "-jar", "app.jar"]
