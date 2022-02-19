.DEFAULT_GOAL := build

PROJECT = pak
OS :=linux
ARCH := amd64

fmt:
	go fmt ./...

lint:
	golangci-lint run --enable-all internal cmd/pak

vet:
	go vet ./...

dep:
	go mod download

test:
	go test -race -v ./...
.PHONY:test

clean:
	go clean

build: test
	GOARCH=$(ARCH) GOOS=$(OS) go build -race -ldflags "-extldflags '-static'" -o $(PROJECT) cmd/pak/main.go
.PHONY:build

install:
	go install

coverage:
	go test --cover ./... -coverprofile=coverage.out
