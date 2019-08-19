FROM ubuntu:latest

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install curl ca-certificates openssh-server tzdata

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

RUN apt-get -y install gitlab-ce

RUN openssl req -subj "/C=US/ST=California/L=Fremont/O=42School/OU=Docker/CN=gitlab.yijhuang.com" \
	-nodes -newkey rsa:2048 -keyout gitlab.yijhuang.com.key \
	-x509 -days 365 -out gitlab.yijhuang.com.crt

RUN mkdir -p /etc/gitlab/trusted-certs && \
	chmod 700 /etc/gitlab/trusted-certs && \
	mv gitlab.yijhuang.com.key gitlab.yijhuang.com.crt /etc/gitlab/trusted-certs

RUN mkdir -p /opt/gitlab/sv/sshd/supervise && \
	mkfifo /opt/gitlab/sv/sshd/supervise/ok && \
	printf "#!/bin/sh\nexec 2>&1\numask 077\nexec /usr/sbin/sshd -D\n" > /opt/gitlab/sv/sshd/run && \
	chmod 755 /opt/gitlab/sv/sshd/run && \
	ln -s /opt/gitlab/sv/sshd /opt/gitlab/service && \
	mkdir -p /var/run/sshd

RUN mv /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.orig
COPY gitlab.rb /etc/gitlab/gitlab.rb

EXPOSE 443 22 80

CMD (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && gitlab-ctl tail
