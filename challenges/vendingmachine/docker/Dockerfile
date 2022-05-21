FROM node:17-slim

WORKDIR /usr/src/app

COPY app/package*.json ./

RUN npm install

COPY app/server.js .
COPY app/*.pug ./
COPY app/*.css ./
COPY app/*.png ./
COPY app/jquery.min.js ./
COPY app/client.js ./

EXPOSE 1337
CMD [ "node", "server.js" ]
