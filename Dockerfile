FROM debian:stable

RUN apt update
RUN apt install -y tor screen curl wget nano procps net-tools
RUN sed -i 's/#SocksPort 9050.*/SocksPort 0.0.0.0:9050/g' /etc/tor/torrc
RUN sed -i 's/#SocksPolicy reject */SocksPolicy accept /g' /etc/tor/torrc

EXPOSE 9050/tcp 9050/udp

CMD ["/bin/bash", "-c", "screen -S tor -dm tor; while true; do pkill -HUP tor; sleep 1; done"]
