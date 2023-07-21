FROM ubuntu
RUN apt update
RUN apt install nginx -y
ADD . /var/www/html/
EXPOSE 80
ENTRYPOINT ["nginx" ,"-g","deamon off;"]
