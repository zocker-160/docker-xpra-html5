# Docker image for Xpra HTML5 Server


TH: updated the original archived repo to use a more recent Linux.

xpra docker container with enabled webUI and firefox preinstalled


## example docker-compose

```
version: '3'

services:
    x:
        image: zocker160/xpra-html5-webui
        volumes:
            - /etc/localtime:/etc/localtime:ro
            - x_data:/data
        restart: always
        ports:
            - 8080:10000

volumes:
    x_data: {}

```
