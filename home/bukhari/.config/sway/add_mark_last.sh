#!/usr/bin/env bash
last=

xprop -root -spy _NET_ACTIVE_WINDOW | while :
do
    read line

    [[ -z "$last" ]] || echo $last | swaymsg "[app_id=$last] mark _last"
    last=$(echo "$line" | awk -F' ' '{printf $NF}')
done
