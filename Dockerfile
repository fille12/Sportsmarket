FROM node:10.14.1

RUN mkdir -p /usr/src/sportsmarket1

COPY build /usr/src/sportsmarket1/build

COPY AuthMiddleware.js /usr/src/sportsmarket1/
COPY ProductionData.json /usr/src/sportsmarket1/
COPY Server.js /usr/src/sportsmarket1/
COPY deploy-package.json /usr/src/sportsmarket1/package.json

COPY ServerQueriesSchema.graphql /usr/src/sportsmarket1/
COPY ServerQueriesResolver.js /usr/src/sportsmarket1/
COPY ServerMutationsSchema.graphql /usr/src/sportsmarket1/
COPY ServerMutationsResolver.js /usr/src/sportsmarket1/

WORKDIR /usr/src/sportsmarket1

RUN echo 'package-lock=false' >> .npmrc

RUN npm install

EXPOSE 80

CMD ["node", "Server.js", "./ProductionData.json", "80"]