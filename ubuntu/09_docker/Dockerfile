FROM ubuntu
RUN apt update -y
RUN apt install nginx -y
COPY index.html /var/www/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]