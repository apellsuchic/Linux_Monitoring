#!/bin/bash

function generator_name {
    mapfile -t chars < <(grep -o '.' <<< "$1")
    len=${#chars[@]} # len chars
    for (( i = 0; i < $len; i++)); do
        if [[ $(( i + 1 )) -le $len && ${chars[$i]} != ${chars[$(( i + 1 ))]} ]]; then
            name="${name}${chars[$i]}"
        fi
    done
    mapfile -t chars < <(grep -o '.' <<< "$name")
    len=${#chars[@]} # len chars
    # Теперь chars - это массив, где каждый элемент - символ
    count=0
    flag=-1
    len2=${#chars[@]}
    if [[ $len -eq 1 ]]; then
        num=3
        flag=0
    elif [[ $len -eq 2 ]]; then
        num=2
        flag=0
    elif [[ $len -eq 3 ]]; then
        num=1
        flag=0
    else 
        num=0
    fi
    space=$(df / | grep -v 1K | awk '{print $4}')
    space=$(echo  "${space}/(1024*1024)" | bc)

    while [[ $count -ne $2  && $space -ge 1 ]]; do

        space=$(df / | grep -v 1K | awk '{print $4}')
        space=$(echo  "${space}/(1024*1024)" | bc)

        folder_name=""
        count=$(( $count + 1 ))
        for (( j = 0; j < $len; j++ )); do
            folder_name="${folder_name}${chars[$j]}"

            if [[ $flag == $j ]]; then

                for (( i = 0; $i < $num; i++ )); do
                    folder_name="${folder_name}${chars[$j]}"
                done

                if [[ $(( $len2 - $count )) -ne 0 ]]; then
                    num=$(( $num - 1 ))
                else
                    len2=$(( $len2 + $len ))
                fi
            fi
        done
        num=$(( $num + 1 ))    
        flag=$(( $flag + 1 ))
        if [[ $flag == $len ]]; then
            flag=0
        fi
        name=$(date +%d%m%g)
        folder_name="${3}/${folder_name}_${name}"
        echo $folder_name
    done
    if (( space <= 1 )); then
        echo "Not enough space on the disk" >&2
        exit 2
    fi
}

function files_log {
    date=$(date)
    if [[ -z $2 ]]; then
        log="${1};${date};DIR"
    else
        log="${1};${date};${2};FILE"
    fi
    echo "$log" >> files_log_$(date +%d_%m_%g_).log
}

name_files=$( echo $5 | awk -F. '{print $1}')
ras_files=$( echo $5 | awk -F. '{print $2}')
size=$( echo $6 | awk -Fk '{print $1}')

for i in $( generator_name $3 $2 $1 ); do
    mkdir -p $i
    files_log $i
    for j in $( generator_name $name_files $4 ); do
        name_file="${i}${j}.${ras_files}"
        fallocate -l ${size}K $name_file 2>/dev/null
        if [[ $? -eq 1 ]]; then
            break
        fi
        files_log $name_file $6 $3
    done
done

