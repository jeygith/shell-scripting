#!/bin/bash
# remount disks and restart docker after the disks have been turned off.

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Remount disks cron at: ${DATE}"

# Test if disks are unmounted
ls -la /media/2TB

if [ $? -eq 0 ]; then
  echo "No need to restart containers"
  exit 0
else
  # remount disks and restart select containers
  sudo /usr/bin/umount -l /media/* && sudo /usr/bin/systemctl restart autofs && sudo /usr/bin/systemctl restart docker
  if [ $? -eq 0 ]; then
    echo "Remount and container restart OK"
    exit 0
  else
    echo "Error remounting and restarting containers"
    exit 1
  fi

fi
