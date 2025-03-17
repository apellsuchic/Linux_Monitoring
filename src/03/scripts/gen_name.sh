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
    len=${#chars[@]}
    count=0
    flag=-1
    len2=${#chars[@]}
    if [[ $len -eq 1 ]]; then
        num=4
        flag=0
    elif [[ $len -eq 2 ]]; then
        num=3
        flag=0
    elif [[ $len -eq 3 ]]; then
        num=2
        flag=0
    elif [[ $len -eq 4 ]]; then
        num=1
        flag=0
    fi
    while [[ $count -ne $2 ]]; do
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
        folder_name="/${folder_name}_${name}"
        echo $folder_name
    done
}