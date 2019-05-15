# Substitute your own docker index username, if you like.
DOCKER_USER=zocker160

# Change this to suit your needs.
TAG:=xpra-html5-webui

all: build

build:
	docker build -t="$(DOCKER_USER)/$(TAG)" .

