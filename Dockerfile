FROM centos:centos6

RUN yum -y install httpd httpd-devel && \
    yum -y install php php-devel && \
    yum -y install php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc
    
    
ADD icodecho.php /var/www/html/icodecho.php

EXPOSE 80

CMD ["service httpd start"]
