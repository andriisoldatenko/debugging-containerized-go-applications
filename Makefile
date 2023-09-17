.PHONY: build-sample-app
build-sample-app: ## Build docker image for sample-app
	docker build -f Dockerfile -t asoldatenko/sample-app .

kind-setup:
	kind create cluster --name=debug-kind
	kubectl namespace create demo

kind-dlv-debug:
	docker build -f Dockerfile-dlv-debug -t asoldatenko/my-golang-app:new-tag .
	kind load docker-image asoldatenko/my-golang-app:new-tag --name=debug-kind
	kubectl apply -f ./config/samples/sample.yaml
	kubectl exec -n demo sample-app -it -- /bin/sh
