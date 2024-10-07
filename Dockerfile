FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .
RUN ./mvnw package
CMD ["java", "-jar", "target/my-shop-1.0.jar"]
