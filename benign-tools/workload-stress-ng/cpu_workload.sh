#!/bin/bash

STRESS_DURATION="5m"
STRESS_INTERVAL="300"
STRESS_CPU=4

while true; do
  stress-ng --cpu $STRESS_CPU --timeout $STRESS_DURATION --metrics-brief
  sleep $STRESS_INTERVAL
done
