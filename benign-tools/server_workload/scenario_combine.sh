#!/bin/bash

RANDOM=$(date +%s%N)

# Define server details
# need to modify server ip to the correct ip
SERVER=192.168.2.1
PORT=80
URI=/items

NUM_REQUESTS=1

perform_get() {
    echo "Performing GET request"
    httperf --server $SERVER --port $PORT --uri $URI --num-calls $NUM_REQUESTS &
}

perform_post() {
    echo "Performing POST request"
    curl -X POST -H "Content-Type: application/json" -d '{"name":"New Item"}' http://$SERVER:$PORT$URI &
}

perform_put() {
    echo "Performing PUT request"
    ITEM_ID=$((RANDOM % 10 + 1))
    curl -X PUT -H "Content-Type: application/json" -d '{"name":"Updated Item"}' http://$SERVER:$PORT$URI/$ITEM_ID &
}

wait_for_available_slot() {
    while [ $(jobs -p | wc -l) -ge $MAX_CONCURRENT_REQUESTS ]; do
        sleep 1
    done
}

while true; do

    wait_for_available_slot

    REQUEST_TYPE=$((RANDOM % 3))

    case $REQUEST_TYPE in
        0) perform_get;;
        1) perform_post;;
        2) perform_put;;
    esac

    if [ $((RANDOM % 10)) -eq 0 ]; then
        # 10% chance to sleep between 1 and 10 seconds
        SLEEP_TIME=$((RANDOM % 10 + 1))
        echo "Sleeping for $SLEEP_TIME seconds..."
        sleep $SLEEP_TIME
    fi
done