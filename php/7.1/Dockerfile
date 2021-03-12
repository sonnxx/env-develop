FROM debian:buster

LABEL maintainer="XuanSon <xuansonitvn@gmail.com>" \
	org.label-schema.name="Debian with PHP 7.1, optimised using PHP-FPM"
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

# Install PHP 7.1
RUN	apt-get -y install \
	php7.1 php7.1-cgi php7.1-cli php7.1-common php7.1-curl php7.1-dev php7.1-gd php7.1-gmp php7.1-json php7.1-ldap php7.1-mysql \
	php7.1-odbc php7.1-opcache php7.1-pgsql php7.1-pspell php7.1-readline php7.1-sqlite3 php7.1-tidy \
	php7.1-xml php7.1-xmlrpc php7.1-xdebug \
	libphp7.1-embed php7.1-bcmath php7.1-bz2 php7.1-enchant php7.1-fpm php7.1-imap php7.1-interbase php7.1-intl php7.1-mbstring php7.1-redis \
	php7.1-phpdbg php7.1-soap php7.1-sybase php7.1-xsl php7.1-zip php7.1-dba \
	# php7.1-mysqlnd-ms  php7.1-recode \
    php7.1-memcached php7.1-mongodb php7.1-imagick

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

RUN update-alternatives --set php /usr/bin/php7.1

ADD ./conf.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf
ADD ./conf.d/php.ini /etc/php/7.1/fpm/php.ini
ADD ./conf.d/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf

WORKDIR /var/www/html

EXPOSE 9071

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]