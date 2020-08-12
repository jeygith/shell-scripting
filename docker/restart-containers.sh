#!/bin/bash

declare -a containers=(calibre
  calibre-web
  docker-couchpotato
  docker-headphones
  docker-jackett
  headphones
  heimdall
  home-assistant
  jackett
  lazylibrarian
  librenms
  lidarr
  mosquitto
  nodered
  ombi
  pihole
  plex
  radarr
  sonarr
  spotify-docker-ripper
  spotify-downloader
  tautulli
  transmission
  ubooquity
  varken
)

for container in "${containers[@]}"; do
  cd "/home/githire/docker/${container}" && docker-compose down && docker-compose up -d
done