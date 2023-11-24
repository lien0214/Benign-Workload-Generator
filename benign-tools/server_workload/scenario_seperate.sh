#!/bin/bash

RANDOM=$(date +%s%N)

# Define server details
# need to modify server ip to the correct ip
SERVER=192.168.2.1
PORT=80
URI=/items

MAX_REQUESTS_PER_CYCLE=5

perform_get() {
    echo "Performing GET request"
    httperf --server $SERVER --port $PORT --uri $URI --num-calls 1
}

perform_post() {
    echo "Performing POST request"
    curl -X POST -H "Content-Type: application/json" -d '{"name":"New Item"}' http://$SERVER:$PORT$URI
}

perform_put() {
    echo "Performing PUT request"
    ITEM_ID=$((RANDOM % 10 + 1))
    curl -X PUT -H "Content-Type: application/json" -d '{"name":"Updated Item"}' http://$SERVER:$PORT$URI/$ITEM_ID
}

while true; do
    REQUEST_TYPE=$((RANDOM % 3))

    num_requests_this_cycle=$((RANDOM % MAX_REQUESTS_PER_CYCLE + 1))

    for (( i=0; i<num_requests_this_cycle; i++ )); do
        REQUEST_TYPE=$((RANDOM % 3))

        case $REQUEST_TYPE in
            0) perform_get;;
            1) perform_post;;
            2) perform_put;;
        esac
    done

    # Wait for all background processes (HTTP requests) to finish
    wait

    SLEEP_TIME=$((RANDOM % 5 + 1))
    echo "Sleeping for $SLEEP_TIME seconds..."
    sleep $SLEEP_TIME
done