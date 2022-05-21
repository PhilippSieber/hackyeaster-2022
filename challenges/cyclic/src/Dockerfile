FROM haskell:9

RUN mkdir -p /tmp/work
WORKDIR /tmp/work

ADD compile.sh .
ADD main.hs .
RUN chmod +x compile.sh
RUN ./compile.sh


