#!/bin/bash

#this script gets the ipv4 and updates to custom ddns server

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "Plex docker restart at: ${DATE}"


cd $HOME/docker/plex && /usr/local/bin/docker-compose down && /usr/local/bin/docker-compose up -d
