#!/bin/bash
# Dentry workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

while true; do
    dentry_workers=$(random_number 1 10)
    dentry_ops=$(random_number 10 100)
    dentries=$(random_number 1 10)

    stress-ng --dentry $dentry_workers --dentry-ops $dentry_ops --dentries $dentries
done
