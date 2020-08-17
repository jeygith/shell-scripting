#!/bin/bash

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Restart select containers at: ${DATE}"

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
  cd "/home/githire/docker/${container}" && /usr/local/bin/docker-compose down && /usr/local/bin/docker-compose up -d
done
