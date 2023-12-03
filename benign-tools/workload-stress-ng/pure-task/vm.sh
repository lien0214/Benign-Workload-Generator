#!/bin/bash
# VM workload script

random_number() {
    echo $(( (RANDOM % ($2 - $1 + 1)) + $1 ))
}

while true; do
    # Random parameters for 'vm'
    vm_workers=$(random_number 1 10)
    vm_bytes_num=$(random_number 1 100)
    vm_bytes="${vm_bytes_num}M"
    vm_ops=$(random_number 10 100)
    vm_hang=$(random_number 1 5)

    # Random parameters for 'vm-rw'
    vm_rw_workers=$(random_number 1 10)
    vm_rw_bytes_num=$(random_number 1 100)
    vm_rw_bytes="${vm_rw_bytes_num}M"
    vm_rw_ops=$(random_number 10 100)

    # Random parameters for 'vm-splice'
    vm_splice_workers=$(random_number 1 10)
    vm_splice_ops=$(random_number 10 100)
    vm_splice_bytes_num=$(random_number 1 100)
    vm_splice_bytes="${vm_splice_bytes_num}M"

    vm_addr_workers=$(random_number 1 5)
    vm_addr_ops=$(random_number 10 100)

    vm_segv_workers=$(random_number 1 5)
    vm_segv_ops=$(random_number 10 100)

    # Execute stress-ng with the generated parameters
    stress-ng --vm $vm_workers --vm-bytes $vm_bytes --vm-ops $vm_ops --vm-hang $vm_hang \
              --vm-rw $vm_rw_workers --vm-rw-bytes $vm_rw_bytes --vm-rw-ops $vm_rw_ops \
              --vm-splice $vm_splice_workers --vm-splice-ops $vm_splice_ops --vm-splice-bytes $vm_splice_bytes \
              --vm-addr $vm_addr_workers --vm-addr-ops $vm_addr_ops \
              --vm-segv $vm_segv_workers --vm-segv-ops $vm_segv_ops
done
