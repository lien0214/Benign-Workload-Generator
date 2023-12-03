#!/bin/bash
# main pure-task

TIME=120s

# hdd workload
timeout $TIME bash ./pure-task/hdd.sh

# I/O workload including io, iomix and ioport
timeout $TIME bash ./pure-task/io.sh

# vm workload including vm, vm read/write, vm address work, vm seg for unmp and vm splice
timeout $TIME bash ./pure-task/vm.sh

# matrix workload including 2D and 3D
timeout $TIME bash ./pure-task/matrix.sh

# fork workload
timeout $TIME bash ./pure-task/fork.sh

# vfork workload
timeout $TIME bash ./pure-task/vfork.sh

# exec workload
timeout $TIME bash ./pure-task/exec.sh

# cache workload
timeout $TIME bash ./pure-task/cache.sh

# pipe workload
timeout $TIME bash ./pure-task/pipe.sh

# flock workload
timeout $TIME bash ./pure-task/flock.sh

# aio workload
timeout $TIME bash ./pure-task/aio.sh

# dentry workload
timeout $TIME bash ./pure-task/dentry.sh

# fstat workload
timeout $TIME bash ./pure-task/fstat.sh

# inotify workload (need more time to execute)
timeout $TIME bash ./pure-task/inotify.sh

# lockbus workload
timeout $TIME bash ./pure-task/lockbus.sh

# malloc workload
timeout $TIME bash ./pure-task/malloc.sh

# mremap workload
timeout $TIME bash ./pure-task/mremap.sh

# msg workload
timeout $TIME bash ./pure-task/msg.sh

# sem workload
timeout $TIME bash ./pure-task/sem.sh

# shm workload
timeout $TIME bash ./pure-task/shm.sh

# sock workload
timeout $TIME bash ./pure-task/sock.sh

# timer workload
timeout $TIME bash ./pure-task/timer.sh

# vecmath workload
timeout $TIME bash ./pure-task/vecmath.sh

# zero workload
timeout $TIME bash ./pure-task/zero.sh

# zlib workload
timeout $TIME bash ./pure-task/zlib.sh  