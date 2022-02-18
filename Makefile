.DEFAULT_GOAL := build

fmt:
	go fmt $(go list ./...)
.PHONY:fmt

lint: fmt
	golint $(go list ./...)
.PHONY:lint

vet: fmt
	go vet $(go list ./...)
.PHONY:vet

test:
	go test -race -v $(go list ./...)
.PHONY:test

clean:
	rm $(NAME)

build: vet
	go build -race -ldflags "-extldflags '-static'" -o pak cmd/pak/main.go
.PHONY:build

install:
	go install

