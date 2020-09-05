#!/bin/bash

## create ip link , ip address and ip route for pihole 10.0.0.199

DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Create static ip route at: ${DATE}"

if route | grep "10.0.0.192"; then
  echo "pihole route exits"
else
  ip link add foobar link enp2s0 type macvlan mode bridge && ip addr add 10.0.0.199/32 dev foobar && ip link set foobar up && ip route add 10.0.0.192/27 dev foobar

  if [ $? -eq 0 ]; then
    echo "static route created ok"
  else
    echo "Error creating static route"
  fi
fi
