#!/bin/bash

if [[ $1 -eq 2 ]]; then
    regex="^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}$"
    read -r -p "Enter the start time of file creation: '2025-03-17 12:46'" start_date
    if [[ -z $start_date || ! $start_date =~ $regex ]]; then
        echo "Incorrect date form! Try again." >&2
        exit 2
    fi
    read -r -p "Enter the end time of file creation: '2025-03-17 12:50'" end_date
        if [[ -z $end_date || ! $end_date =~ $regex ]]; then
        echo "Incorrect date form! Try again." >&2
        exit 2
    fi
    find / -name '*_*' -type d -not -path  '*sbin*' -not -path '*bin*' -newerct "$start_date" ! -newerct "$end_date" -exec rm -rf {} \; 2>/dev/null
fi