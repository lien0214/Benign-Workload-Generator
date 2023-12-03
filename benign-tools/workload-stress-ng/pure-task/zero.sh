#!/bin/bash
# Zero workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1 + 1)) + $1 ))
}

while true; do
    zero_workers=$(random_number 1 10)
    zero_ops=$(random_number 100000 10000000)

    stress-ng --zero $zero_workers --zero-ops $zero_ops
done
