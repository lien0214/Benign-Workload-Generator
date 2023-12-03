#!/bin/bash
# POSIX Shared Memory workload script

# Function to generate a random number within a specified range
random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    # Generate random parameters for POSIX shared memory stress test
    shm_workers=$(random_number 1 10)
    shm_ops=$(random_number 100 1000)
    shm_bytes=$(random_number 1024 1048576)K  # Random allocation size between 1 KB and 1 MB

    # Execute stress-ng with the POSIX shared memory parameters
    stress-ng --shm $shm_workers \
              --shm-ops $shm_ops \
              --shm-bytes $shm_bytes
done
