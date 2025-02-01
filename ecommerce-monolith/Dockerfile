# Use an official Maven image to build the application
FROM maven:3.9.5-eclipse-temurin-17 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the project files to the container
COPY . .

# Build the JAR file
RUN mvn clean package -DskipTests

# Use a smaller JDK image to run the application
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory for the runtime container
WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/ecommerce-monolith-*.jar /app/ecommerce-monolith.jar

# Expose the application's port
EXPOSE 8080

# Run the JAR file
CMD ["java", "-jar", "/app/ecommerce-monolith.jar"]

