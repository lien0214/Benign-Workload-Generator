#!/bin/bash
# Pipe workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    pipe_workers=$(random_number 1 400)
    pipe_ops=$(random_number 1000 10000)
    pipe_data_size=$(random_number 128 1024)

    stress-ng --pipe $pipe_workers --pipe-ops $pipe_ops --pipe-data-size $pipe_data_size
done
