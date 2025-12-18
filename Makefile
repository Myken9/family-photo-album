.PHONY: lint test run

lint:
	golangci-lint run

fix:
	golangci-lint run --fix


test:
	go test ./...

run:
	go run ./cmd/api
