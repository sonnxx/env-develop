# Environment built with Docker Compose

This is a basic environment built using Docker Compose. It consists following:

| service | version | Port |
|---------|---------|-----|
| Nginx | latest | 80, 443 |
| PHP | 5.6.X, 7.1.X, 7.2.X | 9056, 9071, 9072 |
| MariaDb | latest | 3306 |
| Mongodb | 4.0 | 27017, 37017 |
| Redis | latest | 6379 |
| ElasticSearch | 5.6.12 | 9200, 9300 |
| Supervisor | latest | |
| Rabbitmq | latest | 5672, 15672 |

> Note: As of now, we have 3 different port for different PHP versions. Use appropriate port as per your php version need: 9056, 9071, 9072

## Requirements
- Install Docker >= 18.06.1-ce
- Install Docker compose >= 1.22.0

Before anything, you need to make sure you have Docker properly setup in your environment. For that, refer to the official documentation for both Docker and Docker Compose.

## Usage
You are up and running in three simple steps:
```sh
$ git clone https://github.com/xuansonitvn/env-develop.git env_develop
$ cd env_develop
$ bash/setup.sh
```

#### Nginx
- Create config nginx in folder **nginx/conf.d** with name **example.conf**

```nginx
server {
    listen       80;
    server_name  example.local;
    root /var/www;
    
    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

    #
    # change filename if use PHP version other 
    # php5.conf or php71.conf or php72.conf
    #
    include php71.conf;
}
```

#### add Host

```sh 
$ echo '127.0.0.1 example.local adminer.local rockmongo.local phpmyadmin.local phpredisadmin.local' >> /etc/hosts
```

Services is now ready!! You can access it via http://example.local

## Tools
- Adminer
- phpMyAdmin
- phpRedisAdmin
- Rockmongo

## Docker
Build and start docker compose

```sh
$ cd <folder-docker>
$ docker-compose up --build
```

Run with Docker Compose

```sh
$ docker-compose up -d
```

List container run
```sh
$ docker ps
```

Attach container to debug

```sh
$ docker exec -it <container_id> /bin/bash 
```

