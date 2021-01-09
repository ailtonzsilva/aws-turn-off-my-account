.PHONY: build clean deploy

build:
	export GO111MODULE="on"
	go get -v
	env GOOS=linux go build -ldflags="-s -w" -o bin/books/functions/worker modules/books/functions/worker.go
clean:
	rm -rf ./bin
test:
	go test
deploy: clean build
	serverless deploy --verbose --force
