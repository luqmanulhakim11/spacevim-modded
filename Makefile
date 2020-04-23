DOCKER_USER:=superiorornot
DOCKER_ORGANIZATION=superiorornot
DOCKER_IMAGE:=spacevim-modded:20200423-1


docker-image: 
	docker build -t $(DOCKER_ORGANIZATION)/$(DOCKER_IMAGE) .

docker-push:
	docker login -u $(DOCKER_USER)
	docker push $(DOCKER_ORGANIZATION)/$(DOCKER_IMAGE)

.PHONY: docker-image docker-push
