# Use the OpenJDK 17 (or 21) base image
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all files into the container
COPY . /app

# Make the Maven wrapper executable
RUN chmod +x mvnw

# Install Maven dependencies and build the application (no .jar file required, it'll be built in this step)
RUN ./mvnw clean install -DskipTests

# Expose port 8080 for the Spring Boot app
EXPOSE 8080

# Run the application (this runs the .jar after building it)
CMD ["java", "-jar", "target/*.jar"]
