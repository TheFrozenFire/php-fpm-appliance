FROM centos:latest
RUN yum upgrade -y
RUN yum localinstall -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum install -y php-fpm php-opcache fcgi
RUN rm /etc/php-fpm.d/www.conf

ADD conf/php-fpm-pool.conf /etc/php-fpm.d/pool.conf
ADD conf/php-opcache.ini /etc/php.d/opcache.ini

VOLUME ["/application"]

ADD warm.sh /warm.sh
ADD warm.php /warm.php
ADD run.sh /run.sh
RUN chmod 755 /*.sh /warm.php

CMD ["/run.sh"]
