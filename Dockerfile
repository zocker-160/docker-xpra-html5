FROM ubuntu:bionic
MAINTAINER Ian Foster <ian@vorsk.com>

ENV DEBIAN_FRONTEND noninteractive

# install xpra
RUN apt-get update && \
    apt-get install -y curl gnupg2 && \
    curl https://xpra.org/gpg.asc | apt-key add - && \
    echo "deb https://xpra.org/ bionic main" > /etc/apt/sources.list.d/xpra.list && \
    apt-get update && \
    apt-get install -y xpra xvfb xterm && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/*

ADD infinityTerm.sh /usr/local/bin/infinityTerm

# non-root user
RUN adduser --disabled-password --gecos "User" --uid 1000 user

# install all X apps here
RUN apt-get update \
    && apt-get install -y firefox \
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/*

USER user

ENV DISPLAY=:100

VOLUME /data

WORKDIR /data

EXPOSE 10000

CMD xpra start --bind-tcp=0.0.0.0:10000 --html=on --start-child=infinityTerm --exit-with-children --daemon=no --xvfb="/usr/bin/Xvfb +extension  Composite -screen 0 1920x1080x30+16 -nolisten tcp -noreset" --pulseaudio=no --notifications=no --bell=no
