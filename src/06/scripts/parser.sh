#!/bin/bash
error=1
if [[ $# != 0 ]]; then
    echo "This script takes no arguments." >&2
    exit 2
fi