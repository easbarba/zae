FROM openjdk:17.0.2-slim-bullseye

WORKDIR /usr/src/app

COPY docs/config/*.yaml /root/.config/pak/
COPY . .

RUN ./gradlew

CMD ["./gradlew", "test"]
