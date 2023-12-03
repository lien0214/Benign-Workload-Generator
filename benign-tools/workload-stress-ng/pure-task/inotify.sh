#!/bin/bash
# Inotify workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    inotify_workers=$(random_number 1 2)
    inotify_ops=$(random_number 1 2)

    stress-ng --inotify $inotify_workers --inotify-ops $inotify_ops
done
