#!/bin/bash

if [[ $1 -eq 3 ]]; then
    find / -type d -name "[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]*_[0-9][0-9][0-9][0-9][0-9][0-9]" 2>/dev/null -exec rm -rf {} \;
fi