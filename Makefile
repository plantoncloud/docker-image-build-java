docker_image_repo=us-central1-docker.pkg.dev/planton-shared-services-jx/planton-pcs-docker-repo-external
docker_image_path=gitlab.com/plantoncode/planton/oss/docker-images/build-java
docker_image_tag?=java-17-planton-cli-v0.0.34
docker_image=${docker_image_repo}/${docker_image_path}:${docker_image_tag}

.PHONY: build
build:
	docker build --platform linux/amd64 -t ${docker_image} .

.PHONY: release
release: build
	docker push ${docker_image}
