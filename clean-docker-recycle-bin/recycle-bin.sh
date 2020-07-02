#!/bin/bash

#this script deletes the docker-recycle bin for the various docker services - sonarr, radarr and lidarr

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Recycle bin clean up at: ${DATE}"

declare recycleBinPath="/media/2TB/docker-recycle-bin"
#declare recycleBinPath=$(pwd)

declare -a paths=(radarr sonarr lidarr)

for path in "${paths[@]}"; do
  path="${recycleBinPath}/${path}"

  # clean up files and folders older than 7 days
  files=$(find ${path} -mtime 7)

  echo""
  echo ">>>>>>Files to delete>>>>>>>"
  echo""
  echo "${files[@]}" | tr ' ' '\n'
  find ${path} -mtime 7 -delete
  
  echo ""
  echo ">>>>> mkdir -p  ${path}"
  mkdir -p ${path}
done
