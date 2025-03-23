#!/bin/bash
function http_meth {
    arr_method=(GET POST PUT PATCH DELETE)
    len_arr_method=${#arr_method[@]}
    index_arr_method=$(( $RANDOM % $len_arr_method ))

    arr_url=(gen folder main green math inf form home profile work date.file)
    len_arr_url=${#arr_url[@]}
    index_arr_url=$(( $RANDOM % $len_arr_url ))
    name_site="http://my_site/"

    version_http=(HTTP/1.1 HTTP/2)
    len_arr_prot=${#version_http[@]}
    index_arr_prot=$(( $RANDOM % $len_arr_prot ))

    echo "\"${arr_method[$index_arr_method]} $name_site${arr_url[$index_arr_url]} ${version_http[$index_arr_prot]}\""

}