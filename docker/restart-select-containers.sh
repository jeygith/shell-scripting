#!/bin/bash

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Restart select containers at: ${DATE}"

declare -a containers=(
  plex
  calibre
  calibre-web
  headphones
  jackett
  lazylibrarian
  ombi
  radarr
  sonarr
  lidarr
  tautulli
  transmission
)

for container in "${containers[@]}"; do
  cd "/home/githire/docker/${container}" && /usr/local/bin/docker-compose down && /usr/local/bin/docker-compose up -d
done
