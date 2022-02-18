FROM golang:1.17-bullseye as builder
LABEL maintainer="EAS Barbosa"

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

ENV GO111MODULE=on
ENV GOOS linux

RUN go build -race -ldflags "-extldflags '-static'" -o pak cmd/pak/main.go

# ---

FROM debian:bullseye-slim

COPY --from=builder /app/pak /usr/local/bin/pak
RUN chmod +x /usr/local/bin/pak

COPY docs/examples/*.yaml /root/.config/pak/

CMD ["pak"]

# ---
# ENV LOG /root/.local/share/pak
