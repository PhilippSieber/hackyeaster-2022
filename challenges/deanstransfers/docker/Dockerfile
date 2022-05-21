FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install bind9

RUN sed -i "s/OPTIONS=\"/OPTIONS=\"-4 /" /etc/default/bind9
ADD files/named.conf.default-zones /etc/bind/
ADD files/db.deanstransfers /etc/bind/

EXPOSE 53
CMD /etc/init.d/bind9 start && /bin/bash