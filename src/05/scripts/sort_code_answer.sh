#!/bin/bash
for i in $(find ../04 -name "nginx[0-4].log"); do
    error=0
    cat $i | sort -nk9,9
done
