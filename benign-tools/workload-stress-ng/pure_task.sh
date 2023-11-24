#!/bin/bash

DURATION=5
LOG_FILE="stress_ng_log.txt"
SLEEP_TIME=5
WORKERS=4

# Function to run a stressor
run_stressor() {
    local stressor=$1
    local args=$2
    echo "Starting stressor: $stressor for $DURATION seconds"
    stress-ng $stressor $args --timeout ${DURATION}s --metrics-brief
    echo "Finished stressor: $stressor" 
    echo "------------------------------------------------------" 
    sleep $SLEEP_TIME
}



run_stressor "--cpu" "$WORKERS"
run_stressor "--hdd" "$WORKERS --hdd-bytes 1G"
run_stressor "--io" "$WORKERS"
run_stressor "--vm" "$WORKERS --vm-bytes 128M"
run_stressor "--matrix" "$WORKERS"
run_stressor "--fork" "$WORKERS"
run_stressor "--cache" "$WORKERS"
run_stressor "--pipe" "$WORKERS"
run_stressor "--flock" "$WORKERS"
run_stressor "--aio" "$WORKERS"
run_stressor "--dentry" "$WORKERS"
run_stressor "--fanotify" "$WORKERS"
run_stressor "--fstat" "$WORKERS"
run_stressor "--inotify" "$WORKERS"
run_stressor "--lockbus" "$WORKERS"
run_stressor "--malloc" "$WORKERS"
run_stressor "--mremap" "$WORKERS"
run_stressor "--msg" "$WORKERS"
run_stressor "--sem" "$WORKERS"
run_stressor "--shm" "$WORKERS"
run_stressor "--sock" "$WORKERS"
run_stressor "--timer" "$WORKERS"
run_stressor "--vecmath" "$WORKERS"
run_stressor "--zero" "$WORKERS"
run_stressor "--zlib" "$WORKERS"

echo "All stressors have completed." 
