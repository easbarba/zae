FROM golang:1.17-alpine

ENV APP "/usr/src/app"
# ENV LOG "/root/.local/share/pak"

# RUN mkdir -p $LOG && touch $LOG/misc.log
COPY docs/examples/ /root/.config/pak

# COPY go.mod go.sum $APP/

WORKDIR $APP

COPY . $APP/

RUN go install

CMD ["go", "run", "main.go"]
