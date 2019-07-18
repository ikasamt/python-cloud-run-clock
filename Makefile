dev:
	docker-compose up --build webapp

build: auth
	docker build -t gcr.io/$(PROJECTID)/$(APPNAME) .

push: auth
	docker push gcr.io/$(PROJECTID)/$(APPNAME)

auth:
	gcloud auth configure-docker

deploy: auth
	gcloud beta run deploy $(APPNAME) \
		--project=$(PROJECTID) \
		--platform=managed \
		--region=asia-northeast1 \
		--image=gcr.io/$(PROJECTID)/$(APPNAME) \
		--memory=512Mi \
		--allow-unauthenticated
