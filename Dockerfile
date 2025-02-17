# Use OpenJDK 21 as base image for Java application
FROM openjdk:21-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper and pom.xml
COPY mvnw pom.xml ./

# Copy the source code and package it
COPY src ./src
RUN ./mvnw clean package

# Copy the built JAR file to the app directory
COPY target/*.jar /app/app.jar

# Expose port 8080 for the Spring Boot app
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "/app/app.jar"]