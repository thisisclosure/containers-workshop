#Build stage
FROM node:12-stretch as build

WORKDIR /builder
RUN npx --ignore-existing create-react-app static-assets-project --template typescript --use-npm

#Get Sass and convert css
WORKDIR /builder/static-assets-project/
RUN npm install node-sass

WORKDIR /builder/static-assets-project/src/
RUN rename "s/css/scss/" *.css
RUN sed -i 's/.css/.scss/g' App.tsx
RUN sed -i 's/.css/.scss/g' index.tsx

WORKDIR /builder/static-assets-project/
RUN npm run build

#Deploy stage
FROM nginx:alpine


WORKDIR /usr/share/nginx/html
COPY --from=build /builder/static-assets-project/build .
