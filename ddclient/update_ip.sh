#!/bin/bash

#this script gets the ipv4 and updates to custom ddns server

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "IP update at: ${DATE}"


declare wanip4=$(dig @resolver1.opendns.com A myip.opendns.com +short -4)

declare secret=3Ef22XoBTj3AnQE1

declare -a domains=(githire-svr transmission)

for domain in "${domains[@]}"; do
  declare url="http://64.227.45.220:8080/update?secret=${secret}&domain=${domain}&addr=${wanip4}"

  echo ${url}

  curl -s "${url}"
done
