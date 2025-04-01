#!/bin/bash

echo "Для завершения нажмите Ctrl^C"
while [[ 0 -lt 1 ]]; do
    cpu=$(top -bn1 | awk '/Cpu/ { print $2}')
    cpu=$(echo $cpu | awk -F, '{printf "%s.%s", $1, $2 }')
    total_RAM=$(free | grep Mem: | awk '{print $2}')
    free_RAM=$(free | grep Mem: | awk '{print $4}')
    BuffCache_RAM=$(free | grep Mem: | awk '{print $6}')
    avail_RAM=$(free | grep Mem: | awk '{print $7}')
    disk_size=$(df --total | grep total | awk '{print $2}')
    exec 1>metrics
    echo "# HELP node_cpu_loading_percentage CPU load percentage.
# TYPE node_cpu_loading_percentage gauge
node_cpu_loading_percentage ${cpu}
# HELP node_memory_MemTotal_bytes Total amount of RAM.
# TYPE node_memory_MemTotal_bytes gauge
node_memory_MemTotal_bytes ${total_RAM}
# HELP node_memory_MemFree_bytes Free amount of RAM.
# TYPE node_memory_MemFree_bytes gauge
node_memory_MemFree_bytes ${free_RAM}
# HELP node_memory_BuffCache_bytes Buff/cache amount of RAM.
# TYPE node_memory_BuffCache_bytes gauge
node_memory_BuffCache_bytes ${BuffCache_RAM}
# HELP node_memory_MemAvail_bytes Avail amount of RAM.
# TYPE node_memory_MemAvail_bytes gauge
node_memory_MemAvail_bytes ${avail_RAM}
# HELP node_filesystem_size_bytes Disk space capacity.
# TYPE node_filesystem_size_bytes gauge
node_filesystem_size_bytes ${disk_size}"
    sleep 3
done