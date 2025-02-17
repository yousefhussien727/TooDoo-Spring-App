# Use the OpenJDK 21 base image
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all files into the container
COPY . /app
# Copy only necessary files first (to improve caching)
# COPY pom.xml mvnw ./
# COPY src ./src

# Make the Maven wrapper executable
RUN chmod +x mvnw

# Install Maven dependencies and build the application (no .jar file required, it'll be built in this step)
RUN ./mvnw clean install -DskipTests

# Copy the built JAR file to a fixed location
RUN cp target/tooDoo-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 for the Spring Boot app
EXPOSE 8080

# Run the application (this runs the .jar after building it)
CMD ["java", "-jar", "app.jar"]
# CMD ["java", "-jar", "target/tooDoo-0.0.1-SNAPSHOT.jar"]
# CMD ["java", "-jar", "target/*.jar"]

