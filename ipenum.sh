#!/bin/bash

ip=${1:-192.168.0}

for completar in $(seq 1 255); do
    ttlstr=$(ping -c1 -w1 $ip.$completar | grep -o 'ttl=[0-9][0-9]*') || {
        continue;
    }
    ttl="${ttlstr#*=}"
    printf "%s online, ttl=%d\n" "$ip.$completar" "$ttl"
done
