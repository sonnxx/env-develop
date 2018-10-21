FROM ubuntu:16.04

MAINTAINER Tuoitre <dev@tuoitre.com.vn>

LABEL maintainer="Tuoitre <dev@tuoitre.com.vn>" \
	org.label-schema.name="Ubuntu 16.04 with mongodb" 
LABEL version="1.0"

# Set up locales
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

# Install mongodb version 3.4
RUN \
   apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
   echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list && \
   apt-get update && \
   apt-get install -y mongodb-org

# Set the timezone Ho_Chi_Minh
RUN cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime



EXPOSE 27017
CMD ["mongod"]