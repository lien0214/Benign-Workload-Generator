#!/bin/bash
# Socket workload script

# Function to generate a random number within a specified range
random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    # General Socket I/O parameters
    sock_workers=$(random_number 1 10)
    sock_ops=$(random_number 1000 10000)

    # Sockdiag parameters
    sockdiag_workers=$(random_number 1 10)
    sockdiag_ops=$(random_number 1000 10000)

    # Socket File Descriptor (sockfd) parameters
    sockfd_workers=$(random_number 1 10)
    sockfd_ops=$(random_number 1000 10000)
    sockfd_port=$(random_number 1024 65535)

    # Socket Pair (sockpair) parameters
    sockpair_workers=$(random_number 1 10)
    sockpair_ops=$(random_number 1000 10000)

    # Many Sockets (sockmany) parameters
    sockmany_workers=$(random_number 1 10)
    sockmany_ops=$(random_number 1000 10000)

    # Execute stress-ng for each socket test
    stress-ng --sock $sock_workers --sock-ops $sock_ops
    stress-ng --sockdiag $sockdiag_workers --sockdiag-ops $sockdiag_ops
    stress-ng --sockfd $sockfd_workers --sockfd-ops $sockfd_ops --sockfd-port $sockfd_port
    stress-ng --sockpair $sockpair_workers --sockpair-ops $sockpair_ops
    stress-ng --sockmany $sockmany_workers --sockmany-ops $sockmany_ops
done
