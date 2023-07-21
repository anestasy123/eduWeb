FROM ubuntu
RUN apt update
RUN apt install nginx
ADD . /var/www/html/
EXPOSE 80
ENTRYPOINT ["nginx" ,"-g","deamon off;"]
