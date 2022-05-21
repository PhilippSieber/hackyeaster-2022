FROM  panubo/sshd:1.3.0

RUN apk add util-linux zip openssl busybox-initscripts

RUN mkdir -p /opt/bannerkoder

COPY files/cipher.sh /opt/bannerkoder/cipher.sh
RUN chmod 744 /opt/bannerkoder/cipher.sh
COPY files/crontab.txt /etc/cron/crontab
RUN crontab /etc/cron/crontab
RUN chmod 644 /etc/crontabs/root

COPY files/setup.sh /etc/entrypoint.d/
RUN chmod +x /etc/entrypoint.d/setup.sh

COPY files/motd /etc/motd

RUN mkdir -p /home/pinky/

COPY files/flag.txt /home/pinky/flag.txt
RUN chmod 400 /home/pinky/flag.txt

EXPOSE 22

