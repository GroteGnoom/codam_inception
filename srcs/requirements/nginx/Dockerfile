FROM debian:buster

RUN apt-get update && apt-get -y install nginx openssl
#https://easyengine.io/tutorials/php/directly-connect-php-fpm/
RUN apt-get -y install libfcgi0ldbl

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

#https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl
#https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04
#req creates new something
#-nodes for no password https://stackoverflow.com/questions/5051655/what-is-the-purpose-of-the-nodes-argument-in-openssl
#https://stackoverflow.com/questions/51899844/nginx-ssl-no-start-line-expecting-trusted-certificate
#-x509 is needed to make it a trusted certificate, -trustout was not recognized?
RUN openssl req -nodes -newkey rsa:4096 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/C=NL/ST=FunkyState/L=BlepCity/O=Bloebla Inc./CN=Ms. Fliebel" -x509
#to use the certificate with curl:
#https://unix.stackexchange.com/questions/451207/how-to-trust-self-signed-certificate-in-curl-command-line

#test the config
#RUN nginx -t
ENTRYPOINT nginx -g "daemon off;"
