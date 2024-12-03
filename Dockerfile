# Use Eclipse Temurin base image for Java 17 on Alpine Linux, supporting multi-architecture including arm64
#FROM --platform=$BUILDPLATFORM eclipse-temurin:17-jre-alpine
FROM --platform=$BUILDPLATFORM openjdk:17-jdk-slim

ARG JAR_FILE=target/nuwas-keycloak-0.0.1-SNAPSHOT.jar

# cd /opt/app
WORKDIR /opt/app

# cp jtt808-server/target/jtt808-server-1.0.0-SNAPSHOT.jar /opt/app/app.jar
COPY ${JAR_FILE} app.jar

RUN apk add --no-cache curl

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]
