FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .
# Give execute permission to the mvnw script
RUN chmod +x ./mvnw
# Run the package command
RUN ./mvnw package
CMD ["java", "-jar", "target/my-shop-1.0.jar"]
