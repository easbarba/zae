FROM golang:bullseye

ENV GO111MODULE=on
ENV GOOS linux

ENV APP "/usr/src/app"
ENV LOG "/root/.local/share/pak"

COPY docs/examples/ /root/.config/pak

COPY . $APP/

WORKDIR $APP

RUN go install ./...

CMD ["go", "run", "cmd/pak/main.go"]
