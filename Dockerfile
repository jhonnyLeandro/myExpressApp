FROM node:18.16.0-alpine3.18

COPY /myExpressApp .

WORKDIR myExpressApp

RUN npm install 

EXPOSE 3000

CMD ["npm", "start"]