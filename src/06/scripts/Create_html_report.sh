#!/bin/bash
for i in $(find ../04 -name "nginx[0-4].log"); do
    error=0
done


if [[ $error -eq 0 ]]; then
    goaccess -f ../04/nginx*.log --log-format=COMBINED -o report.html 
else
    echo "For work this program need creat nginx log file in 04 dir!" >&2
    exit 2
fi
