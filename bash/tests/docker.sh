#!/bin/bash

echo "#######################"
echo "#### Docker Images ####"
echo "#######################"

docker image ls

echo "###########################"
echo "#### Docker Containers ####"
echo "###########################"

docker ps

echo "######################"
echo "#### Docker Ports ####"
echo "######################"

docker port services_nginx_1
docker port services_mongodb_1
docker port services_redis_1
docker port services_elasticsearch_1
docker port services_mariadb_1
docker port services_rabbitmq_1

