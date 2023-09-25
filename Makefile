# Latest commit hash
GIT_SHA=$(shell git rev-parse HEAD)

# If working copy has changes, append `-local` to hash
GIT_DIFF=$(shell git diff -s --exit-code || echo "-local")
GIT_REV=$(GIT_SHA)$(GIT_DIFF)

build-sha:
	docker build -f Dockerfile-git-rev-parse -t git-rev-parse --build-arg GIT_SHA=$(GIT_REV) .

.PHONY: build-sample-app
build-sample-app: ## Build docker image for sample-app
	docker build -f Dockerfile -t asoldatenko/sample-app .

podman-setup:
	podman machine init
	podman machine start

kind-setup:
	kind create cluster --name=debug-kind
	kubectl create namespace demo

kind-dlv-debug:
	docker build -f Dockerfile-dlv-debug -t asoldatenko/my-golang-app:new-tag .
	kind load docker-image asoldatenko/my-golang-app:new-tag --name=debug-kind
	kubectl apply -f ./config/samples/sample.yaml
	kubectl exec -n demo sample-app -it -- /bin/sh

kind-dlv-headless:
	docker build --platform=linux/arm64 -f Dockerfile-dlv-headless-envs -t asoldatenko/dlv-headless-envs:0.0.6 .
	kind load docker-image asoldatenko/dlv-headless-envs:0.0.6 --name=debug-kind
	kubectl apply -f ./config/samples/sample-headless-debug.yaml
	kubectl exec -n demo sample-app -it -- /bin/sh
