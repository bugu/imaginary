OK_COLOR=\033[32;01m
NO_COLOR=\033[0m
VERSION= 1.2.4/0.1

build:
	@echo "$(OK_COLOR)==> Compiling binary$(NO_COLOR)"
	go test && go build -o bin/imaginary

test:
	go test

install:
	go get -u .

benchmark: build
	bash benchmark.sh

docker-build:
	@echo "$(OK_COLOR)==> Building Docker image$(NO_COLOR)"
	docker build --no-cache=true --build-arg IMAGINARY_VERSION=$(VERSION) -t h2non/imaginary:$(VERSION) .

docker-push:
	@echo "$(OK_COLOR)==> Pushing Docker image v$(VERSION) $(NO_COLOR)"
	docker push bugrabilgin/imaginaryfile:$(VERSION)

docker: docker-build docker-push

.PHONY: test benchmark docker-build docker-push docker
