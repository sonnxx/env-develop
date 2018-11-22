FROM ubuntu:16.04

MAINTAINER XuanSon <xuansonitvn@gmail.com>

LABEL maintainer="XuanSon <xuansonitvn@gmail.com>" \
	org.label-schema.name="Ubuntu 16.04 with PHP 5, optimised using PHP-FPM" 
LABEL version="1.0"

# Set up locales
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

# Initial apt update
RUN apt-get update && apt-get -y install wget curl git software-properties-common

# Install common / shared packages
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    vim \
    locales \
    ca-certificates \
    dialog \
    gcc \
    musl-dev \
    libffi-dev \
    iputils-ping \
    net-tools \
    telnet \
	python \
    python-dev \
	python-pip 

# Import the Public Key used by the Ubuntu Package Manager
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

# Create a file list for mongoDB to fetch the current repository
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update the Ubuntu Packages
RUN apt-get update 

# Install MongoDB
RUN apt-get install mongodb -y
# install -y mongodb-org=3.2 mongodb-org-server=3.2 mongodb-org-shell=3.2 mongodb-org-mongos=3.2 mongodb-org-tools=3.2

# Install PHP5.6
RUN	apt-get -y install php5.6-dev php5.6-fpm php5.6-mysqlnd php5.6-curl php5.6-gd php-pear php5.6-imagick php5.6-imap php5.6-mcrypt \
	php5.6-intl php5.6-pspell php5.6-recode php5.6-snmp php5.6-tidy \
	php5.6-xmlrpc php5.6-xsl php5.6-xdebug php5.6-redis php5.6-igbinary php5.6-zip\
	php5.6-mbstring php-amqp php5.6-bcmath php5.6-soap php5.6-mongo

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ && mv /usr/bin/composer.phar /usr/bin/composer

# Set the timezone Ho_Chi_Minh
RUN cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

# Install Supervisor
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/cache

RUN	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN update-alternatives --set php /usr/bin/php5.6

ADD ./conf.d/www.conf /etc/php/5.6/fpm/pool.d/www.conf
ADD ./conf.d/php.ini /etc/php/5.6/fpm/php.ini
ADD ./conf.d/php-fpm.conf /etc/php/5.6/fpm/php-fpm.conf
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf

WORKDIR /var/www/html

EXPOSE 9056 37017

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]