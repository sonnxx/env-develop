#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
DIR=$( cd -P "$( dirname "$SOURCE" )" && cd .. && pwd )

# cd ${DIR}

if [ ! -d "${DIR}/source/html" ]; then
	mkdir "${DIR}/source/html"
fi

dockerComposeFile=docker-compose.yml

unameOut="$(uname -s)"
case "${unameOut}" in
	Darwin*)
		machine=MacOS
		dockerComposeFile=docker-compose.mac.yml
		;;
	Linux*) machine=Linux;;
	CYGWIN*) machine=Cygwin;;
	MINGW*) machine=MinGw;;
	*) machine="UNKNOWN:${unameOut}"
esac
echo ${machine}

docker-compose -f ${dockerComposeFile} down;
docker-compose -f ${dockerComposeFile} up -d --build;

cd -P "$( dirname "$SOURCE" )"
# sh tests/curl.sh
# sleep 5
sh tests/docker.sh

if [[ ${machine} == 'MacOS' ]]; then
	
	ipadress_php5=$( docker exec $(docker ps -qf "name=php5") bash -c "ifconfig docker0 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1" )
	ipadress_php71=$( docker exec $(docker ps -qf "name=php71") bash -c "ifconfig docker0 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1" )
	ipadress_php72=$( docker exec $(docker ps -qf "name=php72") bash -c "ifconfig docker0 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1" )
	echo ""
	echo "|==============================================================|"
	echo "| Note: If is OS Mac, you should update the contents as below =|"
	echo "|==============================================================|"
	echo ""
	echo 'Update IPAddress at file nginx/php5.conf => fastcgi_pass '${ipadress_php5}':9056;'
	echo 'Update IPAddress at file nginx/php71.conf => fastcgi_pass '${ipadress_php71}':9071;'
	echo 'Update IPAddress at file nginx/php72.conf => fastcgi_pass '${ipadress_php72}':9072;'
fi
