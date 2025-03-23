#!/bin/bash
function url_conn {
    arr_url_connection=(Exemple.com Metanit.com Examer.com Path.ru Math.inf Morning_news.com formDelit.su home.ru profile.my work.ru date.su)
    len_arr_url_connection=${#arr_url_connection[@]}
    index_arr_url_connection=$(( $RANDOM % $len_arr_url_connection ))
    name_url_connection="http://"
    url=${arr_url_connection[$index_arr_url_connection]}
    echo "\"$name_url_connection$url\""
}