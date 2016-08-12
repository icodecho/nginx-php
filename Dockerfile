# PHP\Python\NodeJS
# 
# Version:1.0.0

FROM centos:6
MAINTAINER Qingfeng Dubu <1135326346@qq.com>

ENV REFRESHED_AT 2015-06-05
#ENV MY_WGET_FILE_URI http://www.example.com
#ENV MY_WGET_FILE_NAME google.zip

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all

#RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Install supervisor
RUN yum install -y python-setuptools; yum clean all
RUN easy_install pip
RUN pip install supervisor

# Install nginx 
RUN yum -y install nginx; yum clean all

# Install PHP
RUN yum -y --enablerepo=remi,remi-php56 --skip-broken install php-fpm php-common php-cli php-pdo php-mysql php-gd php-imap php-ldap php-odbc php-opcache php-pear php-xml php-devel php-xmlrpc php-mbstring php-mcrypt php-bcmath php-mhash libmcrypt; yum clean all

# Add the configuration file of the nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# Add the configuration file of the Supervisor
ADD supervisord.conf /etc/

# Add the file
ADD icodecho.php /var/www/icodecho.php

# Add the file 
#ADD myfile.sh /myfile.sh
#RUN chmod 755 /myfile.sh

# Install unzip 
# Install wget 
RUN yum -y install unzip; yum clean all
RUN yum -y install wget; yum clean all

#RUN sh /myfile.sh

#RUN rm -rf /var/www/*
#RUN wget -P /var/www/ $MY_WGET_FILE_URI/$MY_WGET_FILE_NAME
#RUN echo "========================================================================"
#RUN echo ""
#RUN echo "==the uri is '$MY_WGET_FILE_URI'=="
#RUN echo "==the file is '$MY_WGET_FILE_NAME'=="
#RUN echo ""
#RUN echo "========================================================================"
#RUN unzip /var/www/$MY_WGET_FILE_NAME -d /var/www/
#RUN rm -rf /var/www/$MY_WGET_FILE_NAME
RUN chmod -R 777 /var/www/
# Set the port to 80 
EXPOSE 80

# Executing supervisord
CMD ["supervisord", "-n"]
