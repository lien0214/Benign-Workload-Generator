#!/bin/bash

STRESS_DURATION="1m"
STRESS_INTERVAL=300
NUM_WORKERS=4
FILE_SIZE=256  # 256MB

echo "Disk I/O stress test completed."

while true; do
  stress-ng --cpu $STRESS_CPU --timeout $STRESS_DURATION --metrics-brief
  sleep $STRESS_INTERVAL
done
