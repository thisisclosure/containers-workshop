FROM node:12-stretch

USER node

RUN mkdir /home/node/src

WORKDIR /home/node/src

COPY --chown=node:node package.json package-lock.json ./

RUN npm ci 

COPY --chown=node:node . .

RUN echo "Working on it ...\n"

CMD ["node", "index.js"]