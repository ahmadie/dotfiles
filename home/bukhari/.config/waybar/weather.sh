#!/usr/bin/env bash
# weather.sh

# Use provided location or fallback to system IP-based location
location="${1:-$(curl -s ipinfo.io/city)}"

for i in {1..5}
do
    response=$(curl -s "https://wttr.in/$location?format=1")
    if [[ $? == 0 ]]
    then
        text=$(echo "$response" | awk '{print $2 " " $1}')
        tooltip=$(curl -s "https://wttr.in/$location?format=4")
        if [[ $? == 0 ]]
        then
            tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
            echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
            exit
        fi
    fi
    sleep 60
done
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"

