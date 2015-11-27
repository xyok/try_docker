FROM centos

MAINTAINER xy xy___ok@163.com

RUN yum update -y
#RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-nginx

# install package
#ADD etc/yum.repos.d/nginx-mainline.repo /etc/yum.repos.d/nginx-mainline.repo
RUN yum install -y nginx patch

# apply patched configuration
ADD etc/nginx/nginx.conf.patch /etc/nginx/nginx.conf.patch
RUN patch /etc/nginx/nginx.conf < /etc/nginx/nginx.conf.patch

#ENV NGINX_VERSION 1.7.12

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

