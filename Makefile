IMAGE ?= $(if $(DOCKER_IMAGE),$(DOCKER_IMAGE),fluentd)
REPO ?= rancher
TAG ?= dev
TARGET_PLATFORMS ?= linux/amd64,linux/arm64
DOCKER_CONTEXT ?= v1.16-4.10
DOCKERFILE ?= $(DOCKER_CONTEXT)/Dockerfile

.PHONY: push-image
push-image:
	docker buildx build \
		$(IID_FILE_FLAG) \
		--platform $(TARGET_PLATFORMS) \
		--target full \
		-f $(DOCKERFILE) \
		-t $(REPO)/$(IMAGE):$(TAG) \
		--push $(DOCKER_CONTEXT)
