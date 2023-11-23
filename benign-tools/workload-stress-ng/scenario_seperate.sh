#!/bin/bash

# Define minimum and maximum durations for stress-ng workloads in seconds
MIN_STRESS_DURATION=5
MAX_STRESS_DURATION=15

# Define minimum and maximum sleep times in seconds
MIN_SLEEP_TIME=1
MAX_SLEEP_TIME=3

# num of CPU
STRESS_CPU=$(nproc)

declare -a stressors=(
  "cpu" "hdd" "io" "vm" "matrix" "fork" "cache" "pipe" "fifo" 
  "flock" "aio" "dentry" "fanotify" "fstat" "inotify" "lockbus" "mall" "mremap"
  "msg" "sem" "shm" "sock" "timer" "vecmath" "zero" "zlib"
)

# Function to pick a random stressor and execute it
function random_stressor {
  local stressor=${stressors[$RANDOM % ${#stressors[@]}]}
  local duration=$((RANDOM % (MAX_STRESS_DURATION - MIN_STRESS_DURATION + 1) + MIN_STRESS_DURATION))
  echo "Running $stressor for $duration seconds..."
  stress-ng --$stressor $STRESS_CPU --timeout ${duration}s --metrics-brief
}

# Infinite loop to perform random workloads followed by random sleep intervals
while true; do
  # Run a random stressor
  random_stressor
  
  # sleep for random time
  sleep_time=$((RANDOM % (MAX_SLEEP_TIME - MIN_SLEEP_TIME + 1) + MIN_SLEEP_TIME))  
  echo "Sleeping for $sleep_time seconds..."
  sleep "${sleep_time}s"
done
