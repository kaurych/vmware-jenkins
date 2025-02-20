FROM centos:latest

MAINTAINER Sergey Kaurov <skaurov@ibs.ru>

ENV TZ=Europe/Moscow

RUN yum install -y epel-release && yum install -y nginx
RUN yum clean all
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir -p /var/www/testsite.dev/html
COPY testsite.dev.conf /etc/nginx/conf.d/testsite.dev.conf
COPY index.html /var/www/testsite.dev/html/index.html

#CMD [ "nginx" ]
CMD ["nginx", "-g", "daemon off;"]
