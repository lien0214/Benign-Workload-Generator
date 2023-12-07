stress-ng --matrix 5 --timeout 30s  &
PID=$!
sudo auditctl -a always,exit -F arch=b64 -S all -k all
sleep 120
sudo auditctl -d always,exit -F arch=b64 -S all -k all