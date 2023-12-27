#!/bin/bash
 
ip_address=$(/bin/cat /home/morgan/.config/bin/target | awk '{print $1}')
machine_name=$(/bin/cat /home/morgan/.config/bin/target | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#3ecae6} %{F#3ecae6}$ip_address%{u-} - $machine_name"
else
    echo "%{F#d2de38}󱜡 %{u-}%{F#d2de38} No victim"
fi
