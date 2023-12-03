#!/bin/bash
# AIO workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    aio_workers=$(random_number 1 10)
    aio_ops=$(random_number 1000 5000)

    stress-ng --aio $aio_workers --aio-ops $aio_ops
done
