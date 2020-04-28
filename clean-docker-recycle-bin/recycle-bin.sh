#!/bin/bash

#this script deletes the docker-recycle bin for the various docker services - sonarr, radarr and lidarr

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Recycle bin clean up at: ${DATE}"

#declare recycleBinPath="/media/2TB/docker-recycle-bin/"
declare recycleBinPath=$(pwd)

declare -a paths=(radarr sonarr lidarr)

for path in "${paths[@]}"; do
  path="${recycleBinPath}/${path}"
  echo ${path};

  # clean up files and folders older than 7 days

  find ${path} -mtime -1 -delete
done
