#!/bin/bash

while [ 1 ]
do
    rsync -avz --partial /media/2TB/docker-data/musicbrainz/data githire-centos-server:/mnt/data/docker-data/musicbrainz/
    if [ "$?" = "0" ] ; then
        echo "rsync completed normally"
        exit
    else
        echo "Rsync failure. Backing off and retrying..."
        sleep 180
    fi
done
