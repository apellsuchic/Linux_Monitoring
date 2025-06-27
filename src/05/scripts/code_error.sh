#!/bin/bash

OLD_IFS="$IFS"
IFS=$'\n'

for j in $(find ../04 -name "nginx[0-4].log"); do
    error=0
    for i in $(cat $j); do
        echo $i | awk '$9 ~ /^[4-5]/ {print $0}'
    done
done
IFS="$OLD_IFS"
