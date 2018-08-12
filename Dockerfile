FROM alpine:3.7
LABEL maintainer="erik@aulin.co"

ENV MICROMDM_VERSION=v1.3.1

RUN mkdir -p /opt/micromdm/bin && \
    cd /opt/micromdm && \
    wget -O- -O micromdm.zip https://github.com/micromdm/micromdm/releases/download/${MICROMDM_VERSION}/micromdm_${MICROMDM_VERSION}.zip && \
    unzip micromdm.zip && rm micromdm.zip && mv build/linux/* bin/ && rm -rf build

COPY start-micromdm /usr/local/bin/

ENV PATH /opt/micromdm/bin:$PATH

EXPOSE 443
VOLUME ["/var/db/micromdm"]

CMD [ "start-micromdm" ]