# Docker image for Xpra HTML5 Server


TH: updated the original archived repo to use a more recent Linux. Example container at: ousefuldemos/docker-xpra-html5


## example docker-compose

```
version: '2'

services:
    x:
        image: lanrat/xpra-html5
        volumes:
            - /etc/localtime:/etc/localtime:ro
            - x_data:/data
        restart: always
        ports:
            - 80: 10000

volumes:
    x_data: {}

```
