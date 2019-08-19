FROM debian
ENV TS3SERVER_LICENSE=accept
WORKDIR /home/teamspeak
RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y wget bzip2 \ 
	&& wget http://dl.4players.de/ts/releases/3.7.1/teamspeak3-server_linux_amd64-3.7.1.tar.bz2 \
	&& tar -jxvf teamspeak3-server_linux_amd64-3.7.1.tar.bz2
WORKDIR teamspeak3-server_linux_amd64
ENTRYPOINT sh ts3server_minimal_runscript.sh
