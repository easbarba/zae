FROM golang:alpine3.15

ENV APP "/app"
ENV LOG "/root/.local/share/distro"

RUN mkdir -p $LOG && touch $LOG/misc.log

# COPY package.json package-lock.json $APP/
COPY examples/ /root/.config/distro

WORKDIR $APP/

# RUN npm install

COPY . $APP/

CMD ["go", "main"]
