FROM node:8-alpine as build
ADD . /app
WORKDIR /app
RUN npm install && \
      node_modules/.bin/gulp build

FROM nginx:mainline-alpine AS run
COPY --from=build /app/dist /usr/share/nginx/html
