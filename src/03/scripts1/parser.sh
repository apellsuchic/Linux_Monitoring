#!/bin/bash
REGEX="^[1-3]$"
if [[ -z $1 ]]; then
    echo "No arguments specified" >&2
    exit 2
elif [[ ! -z $2 ]]; then
    echo "This script accepts only one argument" >&2
    exit 2
elif [[ ! $1 =~ $REGEX ]]; then
    echo "Argument must be an integer  between 1 and 3" >&2
    exit 2 
fi
