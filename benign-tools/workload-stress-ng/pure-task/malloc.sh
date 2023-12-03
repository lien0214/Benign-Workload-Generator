#!/bin/bash
# Malloc workload script

# Function to generate a random number within a specified range
random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    # Generate random parameters for malloc stress test
    malloc_workers=$(random_number 1024 8192)
    malloc_bytes=$(random_number 1024 1048576)  # Random allocation size between 1 KB and 1 MB
    malloc_max=$(random_number 1024 16384)         # Random max number of allocations
    malloc_ops=$(random_number 1000 10000)     # Random number of operations
    malloc_thresh=$(random_number 1024 32768)  # Random threshold for malloc to switch from sbrk to mmap

    # Execute stress-ng with the generated malloc parameters
    stress-ng --malloc $malloc_workers \
              --malloc-bytes $malloc_bytes \
              --malloc-max $malloc_max \
              --malloc-ops $malloc_ops \
              --malloc-thresh $malloc_thresh
done
