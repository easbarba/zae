FROM golang:1.17-alpine

ENV APP "/usr/src/app"
# ENV LOG "/root/.local/share/pak"

# RUN mkdir -p $LOG && touch $LOG/misc.log
COPY docs/examples/ /root/.config/pak

COPY . $APP/

WORKDIR $APP

RUN go get ./...

CMD ["go", "run", "cmd/pak/main.go"]
