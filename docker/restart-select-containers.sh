#!/bin/bash

declare -a containers=(
  calibre
  calibre-web
  headphones
  heimdall
  jackett
  lazylibrarian
  librenms
  lidarr
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
  watchtower
)

for container in "${containers[@]}"; do
  cd "/home/githire/docker/${container}" && docker-compose down && docker-compose up -d
done
