FROM debian:buster

LABEL maintainer="XuanSon <xuansonitvn@gmail.com>" \
	org.label-schema.name="Debian with PHP 5.6, optimised using PHP-FPM"
LABEL version="1.0"

# Set up locales
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

# Initial apt update
RUN apt-get update && apt-get -y install wget curl git gnupg \
	software-properties-common
# python-software-properties

# Install common / shared packages
RUN apt-get -y install lsb-release apt-transport-https ca-certificates
RUN	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

# Create a file list for mongoDB to fetch the current repository
# not support debian 9 0 buster
# RUN wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | apt-key add -
# RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    vim \
    locales \
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

# Install MongoDB
# RUN apt-get install mongodb-org -y
# install -y mongodb-org=3.2 mongodb-org-server=3.2 mongodb-org-shell=3.2 mongodb-org-mongos=3.2 mongodb-org-tools=3.2

# Install PHP 5.6
RUN	apt-get -y install \
	php5.6 php5.6-cgi php5.6-cli php5.6-common php5.6-curl php5.6-dev php5.6-gd php5.6-gmp php5.6-json php5.6-ldap php5.6-mysql \
	php5.6-odbc php5.6-opcache php5.6-pgsql php5.6-pspell php5.6-readline php5.6-sqlite3 php5.6-tidy \
	php5.6-xml php5.6-xmlrpc php5.6-xdebug \
	libphp5.6-embed php5.6-bcmath php5.6-bz2 php5.6-enchant php5.6-fpm php5.6-imap php5.6-interbase php5.6-intl php5.6-mbstring php5.6-redis \
	php5.6-phpdbg php5.6-soap php5.6-sybase php5.6-xsl php5.6-zip php5.6-dba \
	# php5.6-mysqlnd-ms  php5.6-recode \
    php5.6-memcached php5.6-mongodb php5.6-imagick

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ && mv /usr/bin/composer.phar /usr/bin/composer

# Set time asia/ho_chi_minh
RUN \
    apt-get -y install tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime && date

# Install Supervisor
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/cache

RUN	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/*.list

# if we have leftovers from building, let's purge them (including extra, unnecessary build deps)
RUN    apt-get purge -y --auto-remove

RUN update-alternatives --set php /usr/bin/php5.6

ADD ./conf.d/www.conf /etc/php/5.6/fpm/pool.d/www.conf
ADD ./conf.d/php.ini /etc/php/5.6/fpm/php.ini
ADD ./conf.d/php-fpm.conf /etc/php/5.6/fpm/php-fpm.conf
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf

WORKDIR /var/www/html

EXPOSE 9056

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]