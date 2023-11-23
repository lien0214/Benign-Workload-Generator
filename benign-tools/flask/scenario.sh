#!/bin/bash

# Define server details
SERVER=192.168.0.10
PORT=80
URI=/items

NUM_REQUESTS=1

perform_get() {
    echo "Performing GET request"
    httperf --server $SERVER --port $PORT --uri $URI --num-calls $NUM_REQUESTS
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

# Infinite loop for continuous testing
while true; do
    REQUEST_TYPE=$((RANDOM % 3))

    case $REQUEST_TYPE in
        0) perform_get;;
        1) perform_post;;
        2) perform_put;;
    esac

    SLEEP_TIME=$((RANDOM % 5 + 1))
    echo "Sleeping for $SLEEP_TIME seconds..."
    sleep $SLEEP_TIME
done