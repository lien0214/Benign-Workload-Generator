#!/bin/bash

sudo auditctl -a always,exit -F arch=b64 -S all -k LALA

# class
# "cpu" "cpu-cache" "device" "io" "network" "interrupt" "filesystem" "memory"
# "os" "pipe" "scheduler" "security" "vm"

classes=(
    "pipe"
)

# Create and clear the log file
echo "create log file"
PID_log="PID.log"
> "$PID_log"

# run workload
for classname in "${classes[@]}"; do
    stress-ng --class "$classname" --seq 1 --timeout 2m --timestamp >> "stress-ng-output.log" 2>&1 &
    pid=$!
    echo "stress-ng --class $classname: $pid" >> "$PID_log"
    echo "stress-ng --class $classname: $pid"
    wait $pid
done

echo "All stress tests completed."

# end logging
sudo auditctl -d always,exit -F arch=b64 -S all -k LALA
sudo mv /var/log/audit/audit.log .
# sudo cp /var/log/audit/audit.log log_pure_task