#!/bin/bash

. scripts/write_log.sh


function check_free_space {
    regex="G$"
    space=$(df -h / | grep -e "[0-9]" | awk '{print $4}')
    if [[ ! $space =~ $regex ]]; then
        time_scripts_work
        echo "In system don't free space!" >&2
        exit 2
    fi
}