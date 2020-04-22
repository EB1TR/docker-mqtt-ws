FROM alpine:3.11
MAINTAINER Fabian Malnero fabian@eb1tr.com @EB1TR

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

RUN apk --no-cache add mosquitto mosquitto-clients

VOLUME ["/etc/mosquitto", "/var/lib/mosquitto"]
EXPOSE 1883
EXPOSE 9001

ENV PATH=/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PATH

WORKDIR /etc/mosquitto
COPY . /etc/mosquitto

ENTRYPOINT ["mosquitto"]
CMD ["-c", "mosquitto.conf"]
