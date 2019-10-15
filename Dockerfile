FROM node:10.3.0-alpine as builder

RUN apk add --no-cache git

WORKDIR /usr/src/app

COPY / ./
RUN npm ci

RUN npm run build

FROM nginx as runtime-image

COPY --from=builder /usr/src/app/build /usr/share/nginx/html

EXPOSE 80 443