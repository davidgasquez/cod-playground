
IMAGE_NAME = davidgasquez/cod-playground
IMAGE_VERSION = 0.1.0

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_VERSION) .

clean-build:
	docker build --no-cache -t $(IMAGE_NAME):$(IMAGE_VERSION) .

dev:
	docker run -it --rm -v $(PWD):/workspaces $(IMAGE_NAME):$(IMAGE_VERSION)

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):latest

clean:
	git clean -fdx