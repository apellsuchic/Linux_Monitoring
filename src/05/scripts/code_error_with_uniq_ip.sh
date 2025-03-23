#!/bin/bash

OLD_IFS="$IFS"
IFS=$'\n'

arr=""
for j in $(find ../04 -name "nginx[0-4].log"); do
    error=0
    for i in $(cat $j); do
        res=$(echo $i | awk '$9 ~ /^[4-5]/ {print $0}')
        if [[ ! -z $res ]]; then
            arr+="$res\n"
        fi
    done
done
if [[ $error -eq 0 ]]; then
    echo -e $arr | sort | awk '!seen[$1]++ {print $0}'
fi
IFS="$OLD_IFS"
