FROM centos

MAINTAINER xy xy___ok@163.com

RUN yum update
RUN yum install nginx

EXPOSE 80

