FROM node:18-alpine as builder

WORKDIR "/var/www/html/app"

COPY ./package.json ./
RUN npm install

COPY ./ ./
RUN npm run build

FROM nginx:1.21.6-alpine
COPY --from=builder /var/www/html/app/build /usr/share/nginx/html