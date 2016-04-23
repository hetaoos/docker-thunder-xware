# Dockerizing thunder xware
# xware version: Xware1.0.31 release date: 2014-08-27

FROM ubuntu:16.04
MAINTAINER Null <hetaoos@gmail.com>

RUN /bin/sed -i.bak 's/archive/cn\.archive/' /etc/apt/sources.list
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && apt-get install -y zlib1g-dev lib32z1 lib32ncurses5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /app/bin && \
    mkdir -p /app/mnt/TDDOWNLOAD

COPY thunder /app/
COPY start.sh /app/
VOLUME /app/mnt

WORKDIR /app
RUN chmod +x start.sh && chmod +x ./bin/portal
CMD ["./start.sh"]
