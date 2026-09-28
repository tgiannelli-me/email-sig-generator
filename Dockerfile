FROM nginx:alpine

COPY signature-generator.html /usr/share/nginx/html/index.html

EXPOSE 80
