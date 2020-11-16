#!/bin/bash

#this script gets the ipv4 and updates to custom ddns server

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "IP update at: ${DATE}"

declare wanip4=$(dig @resolver1.opendns.com A myip.opendns.com +short -4)

declare currentIP=$(dig @ns.jeffgithire.dev A plex.githire-svr.dyn.jeffgithire.dev +short -4)

# ipv4 address octet
octet="(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])"

# avoid zeros on the left
#octet="(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])"

# ipv4 address regex pattern
ip4="^$octet\\.$octet\\.$octet\\.$octet$"

# check if valid ip addresses, and compare if the addresses are similar

if [[ $wanip4 =~ $ip4 ]] && [[ $currentIP =~ $ip4 ]] && [[ "$wanip4" != "$currentIP" ]]; then
  # if ipaddresses are not similar, update the ip addresses upstream
  echo y

  echo "Ip needs updating: "
  echo "currentIP: ${currentIP}"
  echo "wanip4: ${wanip4}"

  declare secret=3Ef22XoBTj3AnQE1

  declare -a domains=(githire-svr transmission
    pihole plex headphones tautulli sonarr
    couchpotato jackett radarr lidarr unms lazylibrarian
    ombi heimdall calibre calibre-web preview hass nodered erx router
    librenms varken mqtt openvpn rancher codeserver cockpit grocy
    healthchecks wireshark sqlitebrowser diskover nanom5 deemix youtubedl
  )

  for domain in "${domains[@]}"; do

    # check if domain is tld githire-svr and not append the .githire-svr in the domain name
    if [ "${domain}" != "githire-svr" ]; then
      domain="${domain}.githire-svr"
      echo "${domain}"
    fi

    #construct the url
    declare url="https://dyndns.jeffgithire.dev/update?secret=${secret}&domain=${domain}&addr=${wanip4}"

    echo ${url}

    # make curl call to update the ip for the various domains
    curl -s "${url}"
  done
else
  echo "Ips are equal or not valid: not updating"
  echo "currentIP: ${currentIP}"
  echo "wanip4: ${wanip4}"
fi

exit
