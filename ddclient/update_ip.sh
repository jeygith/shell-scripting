#!/bin/bash

#this script gets the ipv4 and updates to custom ddns server

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "IP update at: ${DATE}"


declare wanip4=$(dig @resolver1.opendns.com A myip.opendns.com +short -4)

declare secret=3Ef22XoBTj3AnQE1

declare -a domains=(githire-svr transmission
                    pihole plex headphones tautulli sonarr
                    couchpotato jackett radarr
                    )

for domain in "${domains[@]}"; do

# check if domain is tld githire-svr and not append the .githire-svr in the domain name
  if [ "${domain}" != "githire-svr" ]
  then
    domain="${domain}.githire-svr"
    echo "${domain}"
  fi

  #construct the url
  declare url="http://64.227.45.220:8080/update?secret=${secret}&domain=${domain}&addr=${wanip4}"

  echo ${url}

# make curl call to update the ip for the various domains
  curl -s "${url}"
done
