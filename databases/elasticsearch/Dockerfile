FROM elasticsearch:5.6.12

MAINTAINER XuanSon <xuansonitvn@gmail.com>

LABEL maintainer="XuanSon <xuansonitvn@gmail.com>" 
LABEL version="1.0"

# Set up locales
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

# Initial apt update
RUN apt-get update && apt-get -y install wget curl git software-properties-common 
# Install common / shared packages
RUN apt-get install -y \
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
    build-essential \
    make \
	python \
    python-dev \
	python-pip

# RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu

RUN apt-get install -y libcurl4-gnutls-dev

# RUN echo "* - nofile 65535" >> /etc/security/limits.conf && \
    # echo "* - memlock unlimited" >> /etc/security/limits.conf && \
    # echo vm.max_map_count=262144 > /etc/sysctl.d/max_map_count.conf && \
    # echo vm.swappiness=0 > /etc/sysctl.d/swappiness.conf

# ENV ES_HEAP_SIZE 1g
# ENV MAX_OPEN_FILES=65535
# ENV MAX_LOCKED_MEMORY=unlimited

# Set time asia/ho_chi_minh
RUN \
  apt-get -y install tzdata && \
  ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime && date

EXPOSE 9200 9300

CMD ["elasticsearch"]