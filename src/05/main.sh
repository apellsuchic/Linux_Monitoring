#!/bin/bash

#1) sort -nk9 nginx1.log > a.txt sort of code answer
#2) sort -uk1 nginx1.log sort of uniq value ip
regex="^[4-5]"
#cat ../04/nginx1.log | awk '{print $9}'
# Сохраняем старое значение IFS (важно!)
OLD_IFS="$IFS"

# Устанавливаем IFS равным символу новой строки
IFS=$'\n'

for i in $(cat ../04/nginx1.log); do
    res=$(echo $i | awk '{print $9}')
    if [[ $res =~  $regex ]]; then
        #echo $i
        f=0
    fi
done
arr=""
for i in $(cat ../04/nginx1.log); do
    res=$(echo $i | awk '{print $9}')
    if [[ $res =~  $regex ]]; then
        arr+="$i\n"
    fi
done
echo -e $arr | sort -uk1
IFS="$OLD_IFS"