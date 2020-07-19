#!/bin/bash

if [ ! "$(docker ps -q -f name=nginxdeb)" ]; then
    echo "nginxdeb not found"
else
    echo "removing container nginxdeb"
    docker rm -f nginxdeb
fi


# if [ "$(docker image ls docker_nginxstud.debianbase)" ]; then
#     echo "removing container nginxdeb"
#     docker image rm docker_nginxstud.debianbase -f
# fi


docker-compose -f "docker/docker-compose.yml" down ## call down to get new volume https://github.com/docker/compose/issues/4476
docker-compose -f "docker/docker-compose.yml" --no-ansi up -d  --build --force-recreate --remove-orphans  # "Build images before starting containers." ... so that you get changes in 'context' folder.
docker ps  -a
#docker attach nginxdeb