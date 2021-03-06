#!/bin/bash

dockerHome=/home/githire/docker/

# docker stop $(docker ps -aq)

containers=($(ls ${dockerHome} -aq --ignore=".env" --ignore=".old*" --ignore="appdata" --ignore=".*"))

for container in "${containers[@]}"; do
  cd "${dockerHome}${container}" && docker-compose down && docker-compose up -d
  docker-compose up -d
done

cd "${dockerHome}nodered" && docker-compose down && docker-compose up -d
cd "${dockerHome}mosquitto" && docker-compose down && docker-compose up -d

## exclude unms
#docker-compose -p unms -f ~unms/app/docker-compose.yml up -d
