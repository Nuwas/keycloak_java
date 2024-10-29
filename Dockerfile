#FROM adoptopenjdk/openjdk17:alpine-jre
FROM eclipse-temurin:17-jre-alpine

ARG JAR_FILE=target/nuwas-keycloak-0.0.1-SNAPSHOT.jar

# cd /opt/app
WORKDIR /opt/app

# cp jtt808-server/target/jtt808-server-1.0.0-SNAPSHOT.jar /opt/app/app.jar
COPY ${JAR_FILE} app.jar

RUN apk add --no-cache curl

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]