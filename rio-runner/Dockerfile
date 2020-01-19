FROM alpine

RUN apk update && apk upgrade

RUN apk add curl openrc


RUN curl -sfL https://get.k3s.io | sh -

RUN curl -sfL https://get.rio.io | sh -

RUN rio install

RUN rio -n rio-system pods

RUN rio run -p 80:8080 https://github.com/rancher/rio-demo

