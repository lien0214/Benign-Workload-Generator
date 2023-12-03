#!/bin/bash
# Fork, Vfork, and Exec workload script for stress-ng

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    # Random parameters for 'vfork'
    vfork_workers=$(random_number 1 10)
    vfork_ops=$(random_number 100 1000)
    vfork_max=$(random_number 1 100)


    # Execute stress-ng with the generated parameters
    stress-ng --vfork $vfork_workers --vfork-ops $vfork_ops --vfork-max $vfork_max
done
