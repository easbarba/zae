FROM golang:bullseye as build

ENV GO111MODULE=on
ENV GOOS linux

ENV APP /usr/src/app
COPY . $APP/
WORKDIR $APP
RUN go build -race -ldflags "-extldflags '-static'" -o pak cmd/pak/main.go

# -- PRODUCTION

FROM alpine

COPY --from=build /usr/src/app/pak /usr/local/bin/pak
RUN chmod +x /usr/local/bin/pak
COPY docs/examples/*.yaml /root/.config/pak/

CMD ["pak"]

# ...
# ENV LOG /root/.local/share/pak
