FROM ubuntu:16.04

MAINTAINER XuanSon <xuansonitvn@gmail.com>

LABEL maintainer="XuanSon <xuansonitvn@gmail.com>" \
	org.label-schema.name="Ubuntu 16.04 with PHP 7, optimised using PHP-FPM" 
LABEL version="1.0"

# Set up locales
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

# Initial apt update
RUN apt-get update && apt-get -y install wget curl git software-properties-common python-software-properties

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

# Install PHP7.1
RUN	apt-get -y install php7.1 php7.1-cgi php7.1-cli php7.1-common php7.1-curl php7.1-dev php7.1-gd php7.1-gmp php7.1-json php7.1-ldap php7.1-mysql \
	php7.1-odbc php7.1-opcache php7.1-pgsql php7.1-pspell php7.1-readline php7.1-recode php7.1-sqlite3 php7.1-tidy php7.1-xml php7.1-xmlrpc php7.1-xdebug \
	libphp7.1-embed php7.1-bcmath php7.1-bz2 php7.1-enchant php7.1-fpm php7.1-imap php7.1-interbase php7.1-intl php7.1-mbstring php7.1-redis \
	php7.1-phpdbg php7.1-soap php7.1-sybase php7.1-xsl php7.1-zip php7.1-dba \
    php-memcached php-mysqlnd-ms php-mongodb php-imagick

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ && mv /usr/bin/composer.phar /usr/bin/composer

# Set the timezone Ho_Chi_Minh
RUN cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

# Install Supervisor
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/cache

RUN	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN update-alternatives --set php /usr/bin/php7.1

ADD ./conf.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf
ADD ./conf.d/php.ini /etc/php/7.1/fpm/php.ini
ADD ./conf.d/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 9071

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]