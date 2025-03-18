#!/bin/bash

. scripts/gen_name.sh
. scripts/write_log.sh
. scripts/check_free_space.sh

# Получаю массив со случайными папками в системе
mapfile -t arr < <(find / -type d -writable 2> /dev/null | grep -v -e sbin -e bin -e "^/proc/[0-9]" -e var -e sys | shuf -n 1500)

function max_file_count {
    if [[ ${#1} -eq 1 ]]; then
        res=$(( $RANDOM % 200 ))
    elif [[ ${#1} -eq 2 ]]; then
        res=$(( $RANDOM % 400 ))
    elif [[ ${#1} -eq 3 ]]; then
        res=$(( $RANDOM % 690 ))
    elif [[ ${#1} -eq 4 ]]; then
        res=$(( $RANDOM % 800 ))
    elif [[ ${#1} -eq 5 ]]; then
        res=$(( $RANDOM % 1100 ))
    elif [[ ${#1} -eq 6 ]]; then
        res=$(( $RANDOM % 1350 ))
    elif [[ ${#1} -ge 7 ]]; then
        res=$(( $RANDOM % 1500 ))
    fi
    echo $res
}
name_files=$( echo $2 | awk -F. '{print $1}')
ras_files=$( echo $2 | awk -F. '{print $2}')
size=$( echo $3 | awk -FM '{print $1}')
count_folder=0
num_fold=100
for i in $( generator_name $1  $num_fold ); do
    check_free_space
    if [[ $count_folder -gt ${#arr} ]]; then
        count_folder=0
    fi
    name_folder="${arr[$count_folder]}${i}"
    mkdir -p "${name_folder}" 2>/dev/null
    count_folder=$(( $count_folder + 1 ))
    if [[ $? -eq 1 ]]; then
        continue
    fi
    files_log $name_folder
    num_file=$( max_file_count ${#name_files} )
    for j in $( generator_name $name_files $num_file ); do
        check_free_space
        name_file="${name_folder}${j}.${ras_files}"
        fallocate -l ${size}M $name_file 2>/dev/null
        if [[ $? -eq 1 ]]; then
            break
        fi
        files_log $name_file $3
    done
done
time_scripts_work


