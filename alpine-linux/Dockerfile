#Build stage
FROM node:12-stretch as build
WORKDIR /build
COPY  package.json package-lock.json ./
RUN npm ci
COPY . .

#Runtime stage
FROM alpine:3.10
RUN apk add --update nodejs
RUN addgroup -S node && adduser -S node -G node

USER node

RUN mkdir /home/node/src
WORKDIR /home/node/src

COPY --from=build --chown=node:node /build .

CMD ["node", "index.js"]


