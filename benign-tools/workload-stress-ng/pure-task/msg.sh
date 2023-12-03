#!/bin/bash
# Msg workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    msg_workers=$(random_number 1 10)
    msg_ops=$(random_number 100000 1000000)
    msg_types=$(random_number 1 100)

    stress-ng --msg $msg_workers --msg-ops $msg_ops --msg-types $msg_types
done
