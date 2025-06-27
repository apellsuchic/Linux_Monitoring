#!/bin/bash

OLD_IFS="$IFS"
IFS=$'\n'

res=$(find ../04 -name "nginx[0-4].log")
if [[ ! -z $res ]]; then
error=0
find ../04 -name "nginx[0-4].log" | while read -r j; do
  cat "$j" | awk '$9 ~ /^[4-5]/ {print $0}'
done | sort | awk '!seen[$1]++'
fi

IFS="$OLD_IFS"
