FROM rockylinux:9

MAINTAINER Sergey Kaurov <skaurov@ibs.ru>

ENV TZ=Europe/Moscow

RUN yum install -y epel-release && yum install -y nginx
RUN yum clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN mkdir -p /etc/nginx/vhosts/
RUN mkdir -p /etc/nginx/sites-available/
RUN mkdir -p /var/www/testsite.dev/html
COPY testsite.dev.conf /etc/nginx/sites-available/testsite.dev.conf
COPY index.html /var/www/testsite.dev/html/index.html
RUN ln -s /etc/nginx/sites-available/testsite.dev.conf /etc/nginx/sites-enabled/

CMD [ "nginx" ]
