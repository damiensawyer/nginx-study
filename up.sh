#!/bin/bash

if [ ! "$(docker ps -q -f name=nginxdeb)" ]; then
    echo "nginxdeb not found"
else
    echo "removing container nginxdeb"
    docker rm -f nginxdeb
fi

docker-compose -f "docker/docker-compose.yml" down ## call down to get new volume https://github.com/docker/compose/issues/4476
docker-compose -f "docker/docker-compose.yml" --no-ansi up -d --force-recreate --remove-orphans
docker ps  -a