#!/bin/bash
# Matrix and 3D Matrix workload script for stress-ng

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}


while true; do
    # Random parameters for 'matrix'
    matrix_workers=$(random_number 1 10)
    matrix_ops=$(random_number 1000 10000)
    matrix_size=$(random_number 32 128)

    # Random parameters for 'matrix-3d'
    matrix_3d_workers=$(random_number 1 10)
    matrix_3d_ops=$(random_number 1000 10000)
    matrix_3d_size=$(random_number 32 128)

    # Execute stress-ng with the generated parameters
    stress-ng --matrix $matrix_workers --matrix-ops $matrix_ops --matrix-size $matrix_size \
              --matrix-3d $matrix_3d_workers --matrix-3d-ops $matrix_3d_ops --matrix-3d-size $matrix_3d_size
done
