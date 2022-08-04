FROM ubuntu

RUN apt-get update && \
		apt-get install -y make git emacs-nox openjdk-11-jdk-headless curl

WORKDIR /app

RUN git clone https://github.com/cask/cask.git && \
		cd cask && \
		HOME=/ make install

ADD . plantuml-mode

RUN cd plantuml-mode && \
    ./bin/download-plantuml.sh && \
    make
