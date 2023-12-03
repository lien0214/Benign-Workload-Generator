#!/bin/bash
# Flock workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    flock_workers=$(random_number 1 10)
    flock_ops=$(random_number 1000 10000)

    stress-ng --flock $flock_workers --flock-ops $flock_ops

    sleep_time=$(random_number 1 3)
    sleep $sleep_time
done
