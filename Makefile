.PHONY: build-sample-app
build-sample-app: ## Build docker image for sample-app
	docker build -f Dockerfile -t asoldatenko/sample-app .

.PHONY: build-sample-app
build-sample-app: ## Download goimports locally if necessary.
	docker build -f Dockerfile -t asoldatenko/sample-app .
