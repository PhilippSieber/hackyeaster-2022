FROM sagemath/sagemath:9.4

RUN sudo apt-get update -y && sudo apt-get install -y gpgv socat

RUN sage --pip install pycryptodome

ADD app/server.sage .
ADD app/secrets.py .
ADD app/run.sh .
RUN sudo chmod +x run.sh

ENTRYPOINT [ "sh", "./run.sh" ]

EXPOSE 1337