#!/bin/bash

## create ip link , ip address and ip route for pihole 10.0.0.199

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Create static ip route at: ${DATE}"

EXIST=$(/usr/sbin/ip route show 10.0.0.192/27 | wc -l)

if [ $EXIST -eq 0 ]; then
  echo "pihole route does not exist"
  /usr/sbin/ip link add foobar link enp2s0 type macvlan mode bridge && /usr/sbin/ip addr add 10.0.0.199/32 dev foobar && /usr/sbin/ip link set foobar up && /usr/sbin/ip route add 10.0.0.192/27 dev foobar
  echo "route added"
fi
if [ $EXIST -eq 1 ]; then
    echo "pihole route exits"
fi

