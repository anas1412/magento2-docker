FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install apache2 nano mysql-client \
    && a2enmod rewrite \
    && a2enmod headers \
    && export LANG=en_US.UTF-8 \
    && apt-get update \
    && apt-get install -y software-properties-common \
    && apt-get install -y language-pack-en-base \
    && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata \
    && apt-get update \
    && apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-fpm \
    && apt-get install -y php7.2-mysql php7.2-dom php7.2-simplexml php7.2-ssh2 php7.2-xml php7.2-xmlreader php7.2-curl  php7.2-exif  php7.2-ftp php7.2-gd  php7.2-iconv php7.2-imagick php7.2-json  php7.2-mbstring php7.2-posix php7.2-sockets php7.2-tokenizer \
    && apt-get install -y php7.2-mysqli php7.2-pdo  php7.2-sqlite3 php7.2-ctype php7.2-fileinfo php7.2-zip php7.2-exif \
    && apt-get install -y php7.2 libapache2-mod-php7.2 php7.2-common php7.2-gd hp7.2-mysql php7.2-curl php7.2-intl php7.2-xsl php7.2-mbstring php7.2-zip php7.2-bcmath php7.2-soap php-xdebug php-imagick \
    && sed -i 's/file_uploads = Off/file_uploads = On/g' /etc/php/7.2/apache2/php.ini \
    && sed -i 's/allow_url_fopen = Off/allow_url_fopen = On/g' /etc/php/7.2/apache2/php.ini \
    && sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.2/apache2/php.ini \
    && sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /etc/php/7.2/apache2/php.ini \
    && sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 128M/g' /etc/php/7.2/apache2/php.ini \
    && sed -i 's/max_execution_time = 30/max_execution_time = 3600/g' /etc/php/7.2/apache2/php.ini \
    && rm /var/www/html/* \
    && sed -i "s/None/all/g" /etc/apache2/apache2.conf \
    ##install supervisor and setup supervisord.conf file
    && apt-get install -y supervisor \
    && mkdir -p /var/log/supervisor \
    && apt-get install -y curl \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer 

#RUN rm /etc/apt/preferences.d/no-debian-php

env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2
env LANG               C

WORKDIR /var/www/html/backend-magento

CMD ["/usr/bin/supervisord"]