#!/bin/bash
# Zlib compression workload script

# Function to generate a random number within a specified range
random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

# Function to randomly select a zlib data generation method
random_method() {
    local methods=("zero" "ones" "gray" "rand")
    echo "${methods[$RANDOM % ${#methods[@]}]}"
}

while true; do
    # Generate random parameters for zlib stress test
    zlib_workers=$(random_number 1 10)
    zlib_ops=$(random_number 1000 10000)
    zlib_level=$(random_number 0 9)
    zlib_method=$(random_method)

    stress-ng --zlib $zlib_workers \
              --zlib-ops $zlib_ops \
              --zlib-level $zlib_level \
              --zlib-method $zlib_method
done
