FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

ENV HOME=/app
ENV STEAMCMD_DIR=${HOME}/steamcmd
ENV INSTALL_DIR=${HOME}/.dst
ENV DST_DIR=${HOME}/klei/DoNotStarveTogether
ENV CLUSTER_NAME=MyDediServer


RUN sed -i 's@deb.debian.org@mirrors.aliyun.com@g' /etc/apt/sources.list.d/debian.sources
RUN apt-get update && \
    apt-get install -y  --fix-missing \
    build-essential \
    libstdc++6 \
    libgcc1 \
    libcurl4-gnutls-dev \
    python3 \
    curl \
    wget \
    git \
    tar \ 
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app

RUN mkdir -p ${DST_DIR}
RUN mkdir -p ${STEAMCMD_DIR}
WORKDIR ${STEAMCMD_DIR}
RUN wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"
RUN tar -xvzf steamcmd_linux.tar.gz

EXPOSE 10889
EXPOSE 11000
EXPOSE 11001

COPY ./run.sh ${HOME}/run.sh

CMD ["bash", "${HOME}/run.sh"]
