#!/bin/bash
# Mremap workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    mremap_workers=$(random_number 1 10)
    mremap_ops=$(random_number 100 1000)
    mremap_bytes=$(random_number 256 8192)K

    stress-ng --mremap $mremap_workers --mremap-ops $mremap_ops --mremap-bytes $mremap_bytes
done
