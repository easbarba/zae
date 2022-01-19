FROM docker.io/node:lts-alpine

ENV APP "/app "
ENV LOG "/root/.local/share/distro"

RUN mkdir -p $LOG && touch $LOG/misc.log

COPY package.json package-lock.json $APP/
COPY examples/ /root/.config/distrojs

WORKDIR $APP/

RUN npm install

COPY . $APP/

CMD ["bin/distro.js", "system"]
