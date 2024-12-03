FROM --platform=$BUILDPLATFORM openjdk:17-jdk-slim

ARG JAR_FILE=target/nuwas-keycloak-0.0.1-SNAPSHOT.jar

# Set working directory
WORKDIR /opt/app

# Copy the JAR file
COPY ${JAR_FILE} app.jar

# Install curl using apt since this is a Debian-based image
RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
