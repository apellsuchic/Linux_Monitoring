#!/bin/bash

if [[ $1 -eq 1 ]]; then
    f=$( find ./ -name files_log_*.log  2>/dev/null)
    if [[ -z $f ]]; then
        echo "File do not find" >&2
        exit 2 
    fi       
    file=$(cat $f | awk -F';' '{print $1}') 
    for i in $file; do
        rm -rf $i 2>/dev/null
    done
fi