FROM centos:centos7
MAINTAINER andrew.zhao

RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum -y install nginx httpd-tools
RUN mkdir -p /etc/nginx/conf.d

RUN htpasswd -bc /etc/nginx/conf.d/htpasswd.users admin greaconsulting

ENTRYPOINT ["nginx"]

CMD ["-g","daemon off;"]
