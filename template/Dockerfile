FROM eclipse-temurin:21-jre-jammy

ARG NEOFORGE_VERSION
ENV NEOFORGE_VERSION=${NEOFORGE_VERSION}

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /server && chown 1000:1000 /server

USER 1000:1000

WORKDIR /server

RUN curl -o neoforge-installer.jar \
     "https://maven.neoforged.net/releases/net/neoforged/neoforge/${NEOFORGE_VERSION}/neoforge-${NEOFORGE_VERSION}-installer.jar" \
  && java -jar neoforge-installer.jar --installServer \
  && rm neoforge-installer.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565

CMD ["sh", "run.sh"]