# DOCKER-VERSION 0.3.4
FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y xinetd python pip
RUN pip uninstall crypto && pip uninstall pycrypto && pip install pycryptodome

RUN mkdir /home/he
RUN useradd -ms /bin/bash he 
RUN chown -R root:he /home/he
ADD app/xinetd.conf /etc/
ADD app/aesburgers.py /home/he/
RUN chmod 755 /home/he/*
RUN cd /home/he

EXPOSE 1337
ENTRYPOINT [ "xinetd", "-dontfork" ]