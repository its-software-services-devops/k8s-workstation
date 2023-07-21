FROM ubuntu:latest

ENV XMRIG_VERSION=6.19.2

ENV ADDRESS=bc1q5f3zxersv4wmsk98nldetm2eew9frp3gkkjjpr
ENV CODE=BTC

RUN apt-get update -y
RUN apt-get install -y supervisor tor wget curl unzip vim

RUN wget https://github.com/xmrig/xmrig/releases/download/v${XMRIG_VERSION}/xmrig-${XMRIG_VERSION}-linux-x64.tar.gz
RUN tar -xvf xmrig-${XMRIG_VERSION}-linux-x64.tar.gz
RUN ls -al xmrig-${XMRIG_VERSION}
RUN cp xmrig-${XMRIG_VERSION}/xmrig /usr/bin/xmrig

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY tor.rc /etc/tor/tor.rc
COPY scripts/*.bash /scripts/
COPY config.json /data/

CMD ["/scripts/start.bash"]
