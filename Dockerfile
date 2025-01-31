FROM rockylinux:9

MAINTAINER Dmitriy Mosk <master@dmosk.ru>

ENV TZ=Europe/Moscow

RUN yum install -y epel-release && yum install -y nginx
RUN yum clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/vhosts/
RUN cp iadiutrix.conf /etc/nginx/vhosts/
RUN sed -i "0,/include/s/$/\ninclude \/etc\/nginx\/vhosts\/*.conf;/i" /etc/nginx/nginx.conf

CMD [ "nginx" ]
