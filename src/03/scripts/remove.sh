#!/bin/bash

file=$(cat $1 | awk -F';' '{print $1}')

for i in $file; do
    rm -rf $i 2>/dev/null
done
rm $1
echo "GOOD WORK!"

