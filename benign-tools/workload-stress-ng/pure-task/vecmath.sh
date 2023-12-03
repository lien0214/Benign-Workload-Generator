#!/bin/bash
# Vecmath workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    vecmath_workers=$(random_number 1 10)
    vecmath_ops=$(random_number 1000 10000)

    stress-ng --vecmath $vecmath_workers --vecmath-ops $vecmath_ops
done
