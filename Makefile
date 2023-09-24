.PHONY: build-sample-app
build-sample-app: ## Build docker image for sample-app
	docker build -f Dockerfile -t asoldatenko/sample-app .

kind-setup:
	kind create cluster --name=debug-kind
	kubectl create namespace demo

kind-dlv-debug:
	docker build -f Dockerfile-dlv-debug -t asoldatenko/my-golang-app:new-tag .
	kind load docker-image asoldatenko/my-golang-app:new-tag --name=debug-kind
	kubectl apply -f ./config/samples/sample.yaml
	kubectl exec -n demo sample-app -it -- /bin/sh

kind-dlv-headless:
	docker build -f Dockerfile-dlv-headless-envs -t asoldatenko/dlv-headless-envs:0.0.1 .
	kind load docker-image asoldatenko/dlv-headless-envs:0.0.1 --name=debug-kind
	kubectl apply -f ./config/samples/sample-headless-debug.yaml
	kubectl exec -n demo sample-app -it -- /bin/sh
