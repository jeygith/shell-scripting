#!/bin/bash

dockerHome=/home/githire/docker/

# docker stop $(docker ps -aq)

containers=($(ls ${dockerHome} -aq --ignore=".env" --ignore=".old*" --ignore="appdata" --ignore=".*"))

for container in "${containers[@]}"; do
  cd "${dockerHome}${container}" && docker-compose up -d
done

## ignore unms docker-restart

#docker-compose -p unms -f ~unms/app/docker-compose.yml up -d
