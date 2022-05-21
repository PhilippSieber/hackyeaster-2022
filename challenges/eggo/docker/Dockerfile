FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y socat

RUN mkdir -p /app/eggo
WORKDIR /app/eggo

ADD app/eggo.flag .
ADD app/eggo .
ADD app/run.sh .
RUN chmod +x run.sh

RUN useradd -M eggo

# disable password change
RUN passwd -n 9999 eggo

# make some dirs readonly and disable messaging
RUN chmod -R 755 /tmp
RUN chmod -R 755 /var/tmp
RUN chmod -R 700 /dev/shm
RUN chmod -R 700 /dev/mqueue

# remove su
RUN rm -f /bin/su

USER eggo

ENTRYPOINT [ "bash", "./run.sh" ]

EXPOSE 1337