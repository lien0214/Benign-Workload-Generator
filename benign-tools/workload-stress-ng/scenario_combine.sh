#!/bin/bash

RANDOM=$(date +%s%N)

MIN_STRESS_DURATION=5
MAX_STRESS_DURATION=15

MIN_SLEEP_TIME=1
MAX_SLEEP_TIME=3

MAX_WORKERS_PER_STRESSOR=6

declare -a stressors=(
  "hdd" "io" "vm" "matrix" "fork" "cache" "pipe" 
  "flock" "aio" "dentry" "fstat" "inotify" "lockbus" "mall" "mremap"
  "msg" "sem" "shm" "sock" "timer" "vecmath" "zero" "zlib"
)

function combined_stressors {
  local num_stressors=$((RANDOM % ${#stressors[@]} + 1))
  local stressor_cmds=()

  for (( i=0; i<num_stressors; i++ )); do
    local stressor=${stressors[$RANDOM % ${#stressors[@]}]}
    local workers=$((RANDOM % (MAX_WORKERS_PER_STRESSOR + 1)))
    local duration=$((RANDOM % (MAX_STRESS_DURATION - MIN_STRESS_DURATION + 1) + MIN_STRESS_DURATION))
    stressor_cmds+=("--$stressor $workers --timeout ${duration}s")
  done

  echo "Running combined stressors for varied durations..."
  stress-ng ${stressor_cmds[@]} --metrics-brief
}

while true; do
  combined_stressors
  
  local sleep_time=$((RANDOM % (MAX_SLEEP_TIME - MIN_SLEEP_TIME + 1) + MIN_SLEEP_TIME))  
  echo "Sleeping for $sleep_time seconds..."
  sleep "${sleep_time}s"
done