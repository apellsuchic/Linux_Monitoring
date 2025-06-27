#!/bin/bash
for i in $(find ../04 -name "nginx[0-4].log"); do
    error=0
    cat $i | sort | awk '!seen[$1]++ {print $0}'
done
