FROM eclipse-temurin:21-jre-jammy

ARG NEOFORGE_VERSION
ENV NEOFORGE_VERSION=${NEOFORGE_VERSION}

RUN apt-get update && apt-get install -y curl supervisor && rm -rf /var/lib/apt/lists/*

# Install FileBrowser
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

WORKDIR /server

# Install NeoForge
RUN curl -o neoforge-installer.jar \
     "https://maven.neoforged.net/releases/net/neoforged/neoforge/${NEOFORGE_VERSION}/neoforge-${NEOFORGE_VERSION}-installer.jar" \
  && java -jar neoforge-installer.jar --installServer \
  && rm neoforge-installer.jar

RUN echo "eula=true" > eula.txt

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 25565 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]