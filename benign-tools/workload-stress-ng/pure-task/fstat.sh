#!/bin/bash
# Fstat workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    fstat_workers=$(random_number 1 10)
    fstat_ops=$(random_number 100 1000)

    stress-ng --fstat $fstat_workers --fstat-ops $fstat_ops
done
