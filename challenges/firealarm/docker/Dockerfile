FROM node:17-slim

WORKDIR /usr/src/app

COPY app/package*.json ./

RUN npm install

COPY app/server.js .
COPY app/script.js .
COPY app/index.pug .
COPY app/main.pug .
COPY app/styles.css .

EXPOSE 1337
CMD [ "node", "server.js" ]
