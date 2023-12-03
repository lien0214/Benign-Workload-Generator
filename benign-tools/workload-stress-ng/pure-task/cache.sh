#!/bin/bash
# Cache workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1)) + $1 ))
}

random_flag() {
    [ $((RANDOM % 2)) -eq 0 ] && echo "--$1" || echo ""
}

while true; do
    cache_workers=$(random_number 1 10)
    cache_ops=$(random_number 10 100)
    cache_level=$(random_number 1 3) # Assuming 3 levels of cache; adjust as needed

    # Randomly decide whether to include certain flags
    cache_prefetch=$(random_flag "cache-prefetch")
    cache_flush=$(random_flag "cache-flush")
    cache_fence=$(random_flag "cache-fence")

    # Execute stress-ng with the generated parameters
    stress-ng --cache $cache_workers --cache-ops $cache_ops $cache_prefetch $cache_flush $cache_fence --cache-level $cache_level
done
