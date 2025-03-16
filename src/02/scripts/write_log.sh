#!/bin/bash

function files_log {
    date=$(date)
    if [[ -z $2 ]]; then
        log="${1};${date};DIR"
    else
        log="${1};${date};${2};FILE"
    fi
    echo "$log" >> files_log_$(date +%d%m%g).log
}
function time_scripts_work {
    END_TIME=$(date +%s) 
    difference=$(( $END_TIME - $START_TIME ))
    echo "Start time of work $START_TIME" 
    echo "End of work time $END_TIME"
    echo "Script execution time (in seconds) = $difference"

    exec 1>> files_log_$(date +%d%m%g).log
    echo -e "\nStart time of work $START_TIME" 
    echo "End of work time $END_TIME"
    echo "Script execution time (in seconds) = $difference"
}