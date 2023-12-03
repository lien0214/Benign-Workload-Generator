#!/bin/bash
# hdd workload forever

random_number() {
    echo $((RANDOM % ($2) + $1 ))
}

while true; do
    hdd_workers=$(random_number 1 10)
    hdd_ops=$(random_number 100 1000)

    hdd_bytes_num=$(random_number 1 20)
    hdd_bytes="${hdd_bytes_num}M"
    hdd_write_size=$(random_number 1024 4096)

    stress-ng --hdd $hdd_workers --hdd-ops $hdd_ops --hdd-bytes $hdd_bytes --hdd-write-size $hdd_write_size
done