FROM node:lts-alpine

RUN apk add --no-cache tini

ENV NODE_ENV production
USER root

WORKDIR /app

COPY --chown=node:node . ./

RUN npm i --omit=dev --ignore-scripts

EXPOSE 3000

CMD [ "/sbin/tini", "--", "node", "app.js" ]
