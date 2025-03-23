#!/bin/bash

START_TIME=$(date +%s)

regex3="^[a-zA-Z]{1,7}$"
regex4="^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$"
regex5="^([0-9]|[1-9][0-9]|100)Mb$"

if [[ ! -z $1 ]]; then
    echo "Этот скрипт не принимает аргументов" >&2
    exit 2
fi
