#!/bin/bash
# Lockbus workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    lockbus_workers=$(random_number 1 10)
    lockbus_ops=$(random_number 1000 10000)

    stress-ng --lockbus $lockbus_workers --lockbus-ops $lockbus_ops
done
