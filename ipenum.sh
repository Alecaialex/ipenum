#!/bin/bash

ip=${1:-$1}

for complete in $(seq 1 255); do
    ttlstr=$(ping -c1 -w1 $ip.$complete | grep -o 'ttl=[0-9][0-9]*') || {
        continue;
    }
    ttl="${ttlstr#*=}"
    printf "%s online, ttl=%d\n" "$ip.$complete" "$ttl"
done
