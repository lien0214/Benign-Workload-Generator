#!/bin/bash

# The server details and performance test parameters
SERVER="localhost"
PORT="8080"
NUM_CONNS="100"
RATE="1"
TIMEOUT_DURATION="4m"  # Set this to a duration slightly less than your sleep duration

# Run indefinitely
while true; do
  # Execute httperf command with a timeout to ensure it does not hang
  timeout $TIMEOUT_DURATION httperf --server=$SERVER --port=$PORT --num-conn=$NUM_CONNS --rate=$RATE
  
  # Check if httperf was successful or if it timed out
  if [ $? -eq 124 ]; then
    echo "httperf timed out"
  fi

  # Wait for 5 minutes (300 seconds)
  sleep 300
done
