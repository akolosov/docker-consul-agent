FROM 		akolosov/busybox
MAINTAINER 	Alexey Kolosov <alexey.kolosov@gmail.com>

ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

ADD ./config /config/
ONBUILD ADD ./config /config/

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp
VOLUME ["/data"]

ENV SHELL /bin/bash
ENV DNS_RESOLVES consul
ENV DNS_PORT 53 

ENTRYPOINT ["/bin/consul", "agent", "-config-dir=/config"]
CMD []
