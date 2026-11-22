FROM nginx:1.27-alpine

COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY docs/ /usr/share/nginx/html/dino/

EXPOSE 80
