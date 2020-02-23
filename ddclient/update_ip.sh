#!/bin/bash

#this script gets the ipv4 and updates to custom ddns server

declare wanip4=$(dig @resolver1.opendns.com A myip.opendns.com +short -4)

declare secret=3Ef22XoBTj3AnQE1

declare domain=githire-svr

declare url="https://dyn.jeffgithire.dev/update?secret=${secret}&domain=${domain}&addr=${wanip4}"

echo ${url}

curl -s "https://dyn.jeffgithire.dev/update?secret=${secret}&domain=${domain}&addr=${wanip4}"
