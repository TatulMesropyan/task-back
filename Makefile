.DEFAULT_GOAL := help

.PHONY: init
init:
	npm install

.PHONY: deploy
deploy:
	zip -r main.zip *
	aws lambda update-function-code \
		--function-name ama-backend \
		--zip-file ./main.zip

.PHONY: help
help: ## Displays this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
