#!/bin/bash
# remount disks and restart docker after the disks have been turned off.

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Remount disks at: ${DATE}"

#sudo echo "me"

ls -la /media/openworld

if [ $? -eq 0 ]; then
  echo OK
else
  echo FAIL
fi

#sudo umount -l /media/* && sudo systemctl restart autofs && cd /home/githire/shell-scripting/docker && ./restart-select-containers.sh
