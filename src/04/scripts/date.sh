#!/bin/bash

#[21/мар/2025:01:03:26 +0300]
#a=$(printf "[%s %s]" "$(date +%d/%b/%Y:%I:%m:%S)" "$(date +%z)")
#echo $a

# Надо сделать так, чтоб даты генерировались случайным образом и по возростанию, а не
# Через определённый промежуток времени, как у меня. а вцелом, ты молодец))!
function date {
    count_time=0
    hour=1
    num=$(( $RANDOM % 12 ))
    year=$(( 2020 + $RANDOM % 6 ))
    arr_month=(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
    arr_count_day=(31 28 31 30 31 30 31 31 30 31 30 31)
    day=$(( 1 + $RANDOM % ${arr_count_day[$num]}))
    diff_time=$(( 86400 / $1 ))
    one_moment=0
    while [[ $count -lt $1 ]]; do
        if (( $hour >= 13 )); then
            one_moment=0
            hour=1
        fi
        one_moment=$(( $one_moment + $diff_time ))
        min=$(( $one_moment / 60 ))
        if (( $min >= 60 )); then
            hour=$(( $hour + 1 ))
            if (( $hour == 13 )); then
                continue
            fi
            one_moment=0
            min=0
        fi
        regex="^[0-9]$"
        sec=$(( $one_moment % 60 ))
        flag_hour=0
        flag_min=0
        flag_sec=0
        if [[ $sec =~ $regex ]]; then
            flag_sec=1
            sec1=$sec
            sec="0$sec"
        fi
        if [[ $min =~ $regex ]]; then
            flag_min=1
            min1=$min
            min="0$min"
        fi
        if [[ $hour =~ $regex ]]; then
            flag_hour=1
            hour1=$hour
            hour="0$hour"

        fi
        echo "[$day/${arr_month[$num]}/$year:$hour:$min:$sec"
        if [[ $flag_hour -eq 1 ]]; then
            hour=$hour1
        fi
        if [[ $flag_min -eq 1 ]]; then
            min=$min1
        fi
        if [[ $flag_sec -eq 1 ]];then
            sec=$sec1
        fi
        count=$(( $count + 1 ))
    done

}