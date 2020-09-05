#!/bin/bash

## create ip link , ip address and ip route for pihole 10.0.0.199

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Create static ip route at: ${DATE}"

EXIST=$(ip route show 10.0.0.192/27 | wc -l)

if [ $EXIST -eq 0 ]; then
  echo "pihole route does not exist"
  ip link add foobar link enp2s0 type macvlan mode bridge && ip addr add 10.0.0.199/32 dev foobar && ip link set foobar up && ip route add 10.0.0.192/27 dev foobar
  echo "route added"
fi
if [ $EXIST -eq 1 ]; then
    echo "pihole route exits"
fi
