#!/bin/bash


# class
# "cpu" "cpu-cache" "device" "io" "network" "interrupt" "filesystem" "memory"
# "os" "pipe" "scheduler" "security" "vm"
class=$1

sleep 5s
sudo auditctl -a always,exit -F arch=b64 -S all -k LALA

classes=(
    $class
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
sleep 5s
sudo mkdir /media/sf_shared_folder/new
sudo mv /var/log/audit/audit.log /media/sf_shared_folder/new