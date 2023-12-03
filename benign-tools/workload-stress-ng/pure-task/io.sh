#!/bin/bash
# I/O workload script including io iomix and ioport

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    # Random parameters for 'io'
    io_workers=$(random_number 1 10)
    io_ops=$(random_number 100 1000)

    # Random parameters for 'iomix'
    iomix_workers=$(random_number 1 10)
    iomix_bytes_num=$(random_number 1 1000)
    iomix_bytes="${iomix_bytes_num}M"
    iomix_ops=$(random_number 100 1000)

    # Random parameters for 'ioport'
    ioport_workers=$(random_number 1 10)
    ioport_ops=$(random_number 100 1000)

    # Execute stress-ng with the generated parameters
    stress-ng --io $io_workers --io-ops $io_ops \
              --iomix $iomix_workers --iomix-bytes $iomix_bytes --iomix-ops $iomix_ops \
              --ioport $ioport_workers --ioport-ops $ioport_ops
done
