#!/bin/bash

RANDOM=$(date +%s%N)

MIN_STRESS_DURATION=5
MAX_STRESS_DURATION=15

MIN_SLEEP_TIME=1
MAX_SLEEP_TIME=3

MAX_WORKERS=$(nproc)

declare -a stressors=(
  "cpu" "hdd" "io" "vm" "matrix" "fork" "cache" "pipe"
  "flock" "aio" "dentry" "fanotify" "fstat" "inotify" "lockbus" "mall" "mremap"
  "msg" "sem" "shm" "sock" "timer" "vecmath" "zero" "zlib"
)

function random_stressor {
  local stressor=${stressors[$RANDOM % ${#stressors[@]}]}
  local duration=$((RANDOM % (MAX_STRESS_DURATION - MIN_STRESS_DURATION + 1) + MIN_STRESS_DURATION))
  local workers=$((RANDOM % MAX_WORKERS + 1))
  echo "Running $stressor for $duration seconds..."
  stress-ng --$stressor $workers --timeout ${duration}s --metrics-brief
}

while true; do
  random_stressor
  
  # sleep for random time
  sleep_time=$((RANDOM % (MAX_SLEEP_TIME - MIN_SLEEP_TIME + 1) + MIN_SLEEP_TIME))  
  echo "Sleeping for $sleep_time seconds..."
  sleep "${sleep_time}s"
done
