#!/bin/bash

regex="^[4-5]"
OLD_IFS="$IFS"
IFS=$'\n'

arr=""
for j in $(find ../04 -name "nginx[0-4].log"); do
    error=0
    for i in $(cat $j); do
        res=$(echo $i | awk '{print $9}')
        if [[ $res =~  $regex ]]; then
            arr+="$i\n"
        fi
    done
done
if [[ $error -eq 0 ]]; then
    echo -e $arr | sort -uk1
fi
IFS="$OLD_IFS"
