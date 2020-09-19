#!/bin/bash

containers=$(ls -aq --ignore=".env" --ignore=".old*"  --ignore="appdata" --ignore=".*");

for container in "${containers[@]}"; do
  cd "/home/githire/docker/${container}" && docker-compose down && docker-compose up -d
done


for container in "${containers[@]}"; do
echo ${container}
done
