FROM centos:centos6

RUN yum install httpd httpd-devel && \
    yum install php php-devel && \
    yum install php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc && \
    /etc/init.d/httpd restart
    
    
ADD icodecho.php /var/www/html/icodecho.php
    
