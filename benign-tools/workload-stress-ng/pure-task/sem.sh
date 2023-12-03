#!/bin/bash
# Semaphore workload script

# Function to generate a random number within a specified range
random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    # Generate random parameters for POSIX semaphore stress test
    sem_workers=$(random_number 10 100)
    sem_ops=$(random_number 10000 100000)
    sem_procs=$(random_number 8 64)

    # Execute stress-ng with the POSIX semaphore parameters
    stress-ng --sem $sem_workers \
              --sem-ops $sem_ops \
              --sem-procs $sem_procs
done
