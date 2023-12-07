stress-ng --matrix 5 --timeout 30s  &
PID=!
auditctl -a always,exit -F pid=$PID -F arch=b64 -S all -k test