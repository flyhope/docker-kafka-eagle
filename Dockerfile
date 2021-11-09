FROM openjdk:17-buster

ENV KE_HOME=/opt/efak
ENV EFAK_VERSION=2.0.8

ADD entrypoint.sh /usr/bin

RUN apt-get update && apt-get install -y sqlite gettext wget && \
    mkdir -p /opt/efak;cd /opt/efak && \
    wget https://github.com/smartloli/kafka-eagle-bin/raw/v${EFAK_VERSION}/efak-web-${EFAK_VERSION}-bin.tar.gz && \
    tar zxvf *-bin.tar.gz --strip-components 1 && \
    rm -f *-bin.tar.gz && \
    chmod +x /opt/efak/bin/ke.sh && \
    chmox +x /usr/bin/entrypoint.sh

EXPOSE 8048
WORKDIR /opt/efak
CMD ["entrypoint.sh"]
