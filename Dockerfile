# Use OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

COPY target/my-shop-1.0.jar ./app.jar

EXPOSE 1234
# Run the packaged application
CMD ["java", "-jar", "app.jar"]
