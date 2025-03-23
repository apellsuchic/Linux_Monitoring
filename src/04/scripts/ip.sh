#!/bin/bash
function get_ip {
    ip=$(( $RANDOM % 256 )).$(( $RANDOM % 256 )).$(( $RANDOM % 256 )).$(( $RANDOM % 255 ))
    echo $ip
}