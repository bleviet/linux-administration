FROM ubuntu:jammy

# Set the working directory to the Freeplane source directory
WORKDIR /app/freeplane

# Install wget for downloading Gradle
RUN apt-get update \
    && apt-get install -y wget git openjdk-17-jdk unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and install Gradle
ARG GRADLE_VERSION=8.0
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip \
    && rm gradle-${GRADLE_VERSION}-bin.zip \
    && mv gradle-${GRADLE_VERSION} /opt/gradle

# Add Gradle to the PATH
ENV PATH ${PATH}:/opt/gradle/bin

# The following commands are commented out because they are used for testing the build process of freeplane
# RUN git clone https://github.com/freeplane/freeplane.git
# RUN cd freeplane && git checkout release-1.11.10
# RUN gradle build
