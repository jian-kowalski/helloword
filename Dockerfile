FROM arm64v8/maven as build
COPY . /src
WORKDIR /src
RUN mvn clean package -DskipTests

FROM amazoncorretto:17.0.3
EXPOSE 8080
COPY --from=build /src/target/*.jar /app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]


