FROM node:alpine as stage1

WORKDIR /var/app

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build


FROM nginx

EXPOSE 80

COPY --from=stage1 /var/app/build /usr/share/nginx/html


