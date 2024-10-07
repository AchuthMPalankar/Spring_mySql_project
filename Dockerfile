# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper and pom.xml first to leverage Docker's caching
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Grant execute permission to the Maven wrapper
RUN chmod +x ./mvnw

# Download dependencies (cached in Docker layer)
RUN ./mvnw dependency:go-offline

# Copy the rest of the project files
COPY src ./src

# Package the application
RUN ./mvnw package

# Run the packaged application
CMD ["java", "-jar", "target/my-shop-1.0.jar"]
