FROM node:lts-alpine

COPY package.json package-lock.json /app/
WORKDIR /app/

RUN npm install

COPY examples/ /root/.config/distro
COPY . /app/
