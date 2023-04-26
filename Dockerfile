FROM ubuntu:latest

ENV XMRIG_VERSION=6.19.2
# Do NOT change the DEFAULT_USER env run time
ENV DEFAULT_USER=xmrig 
ENV DEFAULT_PASSWORD=xmrig123
ENV WORKER_ID=xmanxx001
ENV ADDRESS=chnge-this-to-your-wallet
ENV CODE=BTC

RUN apt-get update -y
RUN apt-get install -y supervisor tor openssh-server sudo
RUN apt-get install -y git less groff curl unzip vim
RUN useradd -rm -d /home/${DEFAULT_USER} -s /bin/bash -g root -G sudo -u 1000 ${DEFAULT_USER}
RUN service ssh start

RUN wget https://github.com/xmrig/xmrig/releases/download/v${XMRIG_VERSION}/xmrig-${XMRIG_VERSION}-linux-x64.tar.gz
RUN tar -xvf xmrig-${XMRIG_VERSION}-linux-x64.tar.gz
RUN ls -al xmrig-${XMRIG_VERSION}
RUN cp xmrig-${XMRIG_VERSION}/xmrig /usr/bin/audit-agent

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY tor.rc /etc/tor/tor.rc
COPY scripts/*.bash /scripts/
COPY config.json /data/

CMD ["/scripts/start.bash"]
