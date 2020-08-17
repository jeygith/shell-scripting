#!/bin/bash
# remount disks and restart docker after the disks have been turned off.

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "Remount disks at: ${DATE}"

sudo umount -l /media/* && sudo systemctl restart autofs && sudo systemctl restart docker
