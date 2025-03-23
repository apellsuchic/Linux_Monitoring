#!/bin/bash

OLD_IFS="$IFS"
regex="^[4-5]"
IFS=$'\n'

for j in $(find ../04 -name "nginx[0-4].log"); do
    error=0
    for i in $(cat $j); do
        res=$(echo $i | awk '{print $9}')
        if [[ $res =~ $regex ]]; then
            echo $i
        fi
    done
done
IFS="$OLD_IFS"
