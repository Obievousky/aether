FROM eclipse-temurin:21-jre-jammy

ARG NEOFORGE_VERSION
ENV NEOFORGE_VERSION=${NEOFORGE_VERSION}

WORKDIR /server

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/* \
  && JAR="neoforge-${NEOFORGE_VERSION}-installer.jar" \
  && BASE_URL="https://maven.neoforged.net/releases/net/neoforged/neoforge/${NEOFORGE_VERSION}" \
  && curl -fSL -o "${JAR}" "${BASE_URL}/${JAR}" \
  && EXPECTED=$(curl -fSL "${BASE_URL}/${JAR}.sha1") \
  && ACTUAL=$(sha1sum "${JAR}" | awk '{print $1}') \
  && if [ "$EXPECTED" != "$ACTUAL" ]; then echo "ERROR: Checksum mismatch for ${JAR}" && exit 1; fi \
  && java -jar "${JAR}" --installServer \
  && rm "${JAR}" \
  && apt-get purge -y curl && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

RUN echo "eula=true" > eula.txt

EXPOSE 25565

CMD ["sh", "run.sh"]