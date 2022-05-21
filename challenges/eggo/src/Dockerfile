FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gcc
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y build-essential libssl-dev libffi-dev
RUN pip3 install pwntools

# build
ADD eggo.c .
ADD eggo.flag .
ADD exploit.py .
RUN gcc eggo.c -no-pie -fstack-protector-all -o eggo

ENTRYPOINT [ "/bin/bash" ]
