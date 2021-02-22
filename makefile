TAG=murphyl/nodejs:latest

build:
	docker build -t $(TAG) .

push: build
	docker tag $(TAG) $(TAG)
	docker push $(TAG)