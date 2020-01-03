APP_NAME=recipes

.PHONY: clean
clean:
	docker rmi $(APP_NAME):latest

.PHONY: build
build:
	docker build --tag $(APP_NAME):latest .

.PHONY: run
run:
	docker run --rm -p 8080:80 -d $(APP_NAME):latest

.PHONY: debug
debug:
	docker run --entrypoint "/bin/sh" --rm -p 8080:80 -ti $(APP_NAME):latest