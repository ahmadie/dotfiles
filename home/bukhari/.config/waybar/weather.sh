#!/usr/bin/env bash
# get_weather.sh
for i in {1..5}
do
    response=$(curl -s "https://wttr.in/$1?format=1")
    if [[ $? == 0 ]]
    then
        text=$(echo "$response" | awk '{print $2 " " $1}')
        tooltip=$(curl -s "https://wttr.in/$1?format=4")
        if [[ $? == 0 ]]
        then
            tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
            echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
            exit
        fi
    fi
    sleep 2
done
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
