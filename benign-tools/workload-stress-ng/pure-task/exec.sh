#!/bin/bash
# Exec workload script for stress-ng

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    # Random parameters for 'exec'
    exec_workers=$(random_number 1 10)
    exec_ops=$(random_number 30 300)
    exec_max=$(random_number 1 5)

    # Execute stress-ng with the generated parameters
    stress-ng --exec $exec_workers --exec-ops $exec_ops --exec-max $exec_max
done
