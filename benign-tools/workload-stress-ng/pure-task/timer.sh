#!/bin/bash
# Timer and Timerfd workload script

# Function to generate a random number within a specified range
random_number() {
    echo $(( (RANDOM % ($2 - $1 + 1)) + $1 ))
}

# Function to randomly choose true or false
timerfd-rand() {
    if [ $((RANDOM % 2)) -eq 1 ]; then
        echo "--timerfd-rand"
    else
        echo ""
    fi
}

while true; do
    # Generate random parameters for timer stress test
    timer_workers=$(random_number 1 10)
    timer_ops=$(random_number 1000 10000)
    timer_freq=$(random_number 1 1000000000)
    timer_rand=$(random_bool)

    # Execute stress-ng for timer
    stress-ng --timer $timer_workers \
              --timer-ops $timer_ops \
              --timer-freq $timer_freq \
              $(if $timer_rand; then echo "--timer-rand"; fi)

    # Generate random parameters for timerfd stress test
    timerfd_workers=$(random_number 1 10)
    timerfd_ops=$(random_number 10000 1000000)
    timerfd_freq=$(random_number 100000 1000000000)

    # Execute stress-ng for timerfd
    stress-ng --timerfd $timerfd_workers \
              --timerfd-ops $timerfd_ops \
              --timerfd-freq $timerfd_freq \
              $(timerfd-rand)

    # Optional: Add a sleep period here if needed, e.g., `sleep 1`
done
