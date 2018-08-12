FROM alpine:3.7
LABEL maintainer="erik@aulin.co"

EXPOSE 8443
COPY start-micromdm /usr/local/bin/
CMD [ "start-micromdm" ]

RUN apk --update add ca-certificates

RUN mkdir -p /var/db/micromdm && \
    chown -R nobody:nobody /var/db/micromdm

VOLUME ["/var/db/micromdm"]

ENV MICROMDM_VERSION=v1.3.1
ENV PATH /opt/micromdm/bin:$PATH

RUN mkdir -p /opt/micromdm/bin && \
    cd /opt/micromdm && \
    wget -qO micromdm.zip https://github.com/micromdm/micromdm/releases/download/${MICROMDM_VERSION}/micromdm_${MICROMDM_VERSION}.zip && \
    unzip micromdm.zip && rm micromdm.zip && mv build/linux/* bin/ && rm -rf build

USER nobody