FROM debian:buster

#comment!
RUN apt-get update && apt-get -y install nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf

#test the config
RUN nginx -t
RUN nginx -g "daemon off;"
