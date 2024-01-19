FROM alpine:3.18

ENV NODE_VERSION 18.19.0

RUN cd myExpressApp

RUN npm install && npm start