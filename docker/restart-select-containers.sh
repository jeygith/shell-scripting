#!/bin/bash

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Restart select containers at: ${DATE}"

declare -a containers=(
  plex
  librenms
  calibre
  calibre-web
  headphones
  heimdall
  jackett
  lazylibrarian
  ombi
  radarr
  sonarr
  lidarr
  spotify-docker-ripper
  spotify-downloader
  tautulli
  transmission
  ubooquity
  varken
)

for container in "${containers[@]}"; do
  cd "/home/githire/docker/${container}" && /usr/local/bin/docker-compose down && /usr/local/bin/docker-compose up -d
done
