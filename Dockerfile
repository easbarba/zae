FROM node:lts-alpine

ENV APP "/app "

COPY package.json package-lock.json $APP/
COPY examples/ /root/.config/distro

WORKDIR $APP/

RUN npm install

COPY . $APP/

CMD ["bin/distro.js"]
