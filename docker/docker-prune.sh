#!/bin/bash
# start containers at midnight then prune docker

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "docker prune at: ${DATE}"

/home/githire/shell-scripting/docker/start-containers.sh && /usr/bin/docker system prune -a --volumes -f
