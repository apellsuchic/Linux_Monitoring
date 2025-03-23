#!/bin/bash

. scripts/ip.sh
. scripts/http_methods.sh
. scripts/url_contnect.sh
. scripts/date.sh
. scripts/user_agent.sh
. scripts/code_answer.sh

for (( j = 0; j < 5; j++ )); do
    num=$(shuf -i 100-1000 -n 1)
    timezone=$(( RANDOM % 8 ))
    timezone="+0${timezone}00]"
    file="nginx${j}.log"
    for i in $( date $num ); do
        ip=$( get_ip )
        meth=$( http_meth )
        code=$( code_answer )
        url=$( url_conn )
        agent=$( agent )
        echo "$ip - - $i $timezone $meth $code 123 $url $agent" >> $file
    done
done