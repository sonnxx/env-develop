FROM ubuntu:16.04

MAINTAINER Tuoitre <dev@tuoitre.com.vn>

LABEL maintainer="Tuoitre <dev@tuoitre.com.vn>" \
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
	python \
    python-dev \
	python-pip

# Install PHP7.2
RUN	apt-get -y install php7.2 php7.2-cgi php7.2-cli php7.2-common php7.2-curl php7.2-dev php7.2-gd php7.2-gmp php7.2-json php7.2-ldap php7.2-mysql \
	php7.2-odbc php7.2-opcache php7.2-pgsql php7.2-pspell php7.2-readline php7.2-recode php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-xdebug \
	libphp7.2-embed php7.2-bcmath php7.2-bz2 php7.2-enchant php7.2-fpm php7.2-imap php7.2-interbase php7.2-intl php7.2-mbstring php7.2-redis \
	php7.2-phpdbg php7.2-soap php7.2-sybase php7.2-xsl php7.2-zip php7.2-dba \
    php-memcached php-mysqlnd-ms php-mongodb php-imagick

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ && mv /usr/bin/composer.phar /usr/bin/composer

# Set the timezone Ho_Chi_Minh
RUN cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

# Install Supervisor
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/cache

RUN	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN update-alternatives --set php /usr/bin/php7.2

ADD ./conf.d/www.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD ./conf.d/php.ini /etc/php/7.2/fpm/php.ini
ADD ./conf.d/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 9072

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]