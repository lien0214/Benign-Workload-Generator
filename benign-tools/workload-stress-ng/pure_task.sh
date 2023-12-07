#!/bin/bash

# Define the class names
classes=(
    "cpu" "io" "vm" "disk" "network" "cpu-cache" "device" "security"
    "interrupt" "filesystem" "memory" "os" "pipe" "scheduler"
)

# Create or clear the log file
echo "create log file"
PID_log="PID.log"
> "$PID_log"

# Iterate over each class and run stress-ng
for classname in "${classes[@]}"; do
    stress-ng --class "$classname" --seq 1 --timeout 2m &
    pid=$!
    echo "stress-ng --class $classname: $pid" >> "$PID_log"
    echo "stress-ng --class $classname: $pid"
    wait $pid
done

echo "All stress tests completed."
