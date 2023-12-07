#!/bin/bash

# clear /var/log/audit/ and start logging
sudo rm -f /var/log/audit/*
sudo auditctl -a always,exit -F arch=b64 -S all -k LALA

classes=(
    "cpu" "io" "vm" "disk" "network" "cpu-cache" "device" "security"
    "interrupt" "filesystem" "memory" "os" "pipe" "scheduler"
)

# Create and clear the log file
echo "create log file"
PID_log="PID.log"
> "$PID_log"

# run workload
for classname in "${classes[@]}"; do
    stress-ng --class "$classname" --seq 1 --timeout 2m >> "stress-ng-output.log" 2>&1 &
    pid=$!
    echo "stress-ng --class $classname: $pid" >> "$PID_log"
    echo "stress-ng --class $classname: $pid"
    wait $pid
done

echo "All stress tests completed."

# end logging
sudo auditctl -d always,exit -F arch=b64 -S all -k LALA