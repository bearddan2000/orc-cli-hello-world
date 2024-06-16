FROM openjdk:8-slim

ENV ORC_VERSION 2.1.2

RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://github.com/orc-lang/orc/releases/download/v$ORC_VERSION/orc-$ORC_VERSION.zip \
        -O /tmp/orc.zip && \
    mkdir -p /opt && \
    cd /opt && \
    unzip /tmp/orc.zip && \
    rm /tmp/orc.zip && \
    mv orc-$ORC_VERSION orc && \
    cd orc && \
    ln -s orc-$ORC_VERSION.jar orc.jar && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean

WORKDIR /code

COPY bin .

CMD "./run.sh"