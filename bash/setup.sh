#!/bin/sh

SOURCE="${BASH_SOURCE[0]}"
DIR=$( cd -P "$( dirname "$SOURCE" )" && cd .. && pwd )

cd ${DIR}

if [ ! -d "${DIR}/source/html" ]; then
	mkdir "${DIR}/source/html"
fi

docker-compose -f docker-compose.yml down;
docker-compose -f docker-compose.yml up -d --build;

cd -P "$( dirname "$SOURCE" )"
# sh tests/curl.sh
# sleep 5
sh tests/docker.sh