FROM debian:sid

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apache2 && \
    rm -rf /var/cache/apt

ADD root /

RUN cd /var/www/html/ && \
    chown -R www-data .

RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

