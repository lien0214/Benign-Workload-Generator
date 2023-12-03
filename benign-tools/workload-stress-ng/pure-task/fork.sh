#!/bin/bash
# Fork, Vfork, and Exec workload script for stress-ng

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    # Random parameters for 'fork'
    fork_workers=$(random_number 1 10)
    fork_ops=$(random_number 1000 10000)
    fork_max=$(random_number 1 5)

    # Random parameters for 'exec'
    exec_workers=$(random_number 1 10)

    # Execute stress-ng with the generated parameters
    stress-ng --fork $fork_workers --fork-ops $fork_ops --fork-max $fork_max
done
