#!/bin/bash
REGEX="^[1-4]$"
error=1
if [[ -z $1 ]]; then
    echo "No arguments specified" >&2
    exit 2
elif [[ ! -z $2 ]]; then
    echo "This script accepts only one argument" >&2
    exit 2
elif [[ ! $1 =~ $REGEX ]]; then
    echo "Argument must be an integer  between 1 and 4" >&2
    exit 2
elif [[ $1 -eq 1 ]]; then
    . scripts/sort_code_answer.sh
elif [[ $1 -eq 2 ]]; then
    . scripts/uniq_ip.sh
elif [[ $1 -eq 3 ]]; then
    . scripts/code_error.sh
elif [[ $1 -eq 4 ]]; then
    . scripts/code_error_with_uniq_ip.sh
fi

if [[ $error -eq 1 ]]; then
    echo "For work this program need creat nginx log file in 04 dir!" >&2
    exit 2
fi