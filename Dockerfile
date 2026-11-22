FROM node:20-alpine AS build
WORKDIR /app
COPY index.html hls.min.js jellydinosaur-flash-player.swf build-minify.js ./
RUN node build-minify.js

FROM nginx:1.27-alpine
COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/upload/ /usr/share/nginx/html/dino/
COPY docs/cookie-test.html /usr/share/nginx/html/dino/cookie-test.html
EXPOSE 80
