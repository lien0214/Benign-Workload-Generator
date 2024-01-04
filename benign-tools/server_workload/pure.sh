#!/bin/bash

RANDOM=$(date +%s%N)

# Define server details
# need to modify server ip to the correct ip
SERVER=192.168.2.1
PORT=80
URI=/items

REQUESTS_NUM=10000

perform_get() {
    echo "Performing GET request"
    curl http://$SERVER:$PORT$URI
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

REQUEST_TYPE=$1


for (( i=0; i<$REQUESTS_NUM; i++ )); do
    case $REQUEST_TYPE in
        0) perform_get;;
        1) perform_post;;
        2) perform_put;;
    esac
done

# Wait for all background processes (HTTP requests) to finish
wait