#!/bin/bash

if [[ ! -z $1 ]]; then
    echo "Этот скрипт не принимает аргументов" >&2
    exit 2
fi
