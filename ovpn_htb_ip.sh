 #!/bin/sh

IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
 
if [ "$IFACE" = "tun0" ]; then
    echo "%{F#3ecae6} %{F#3ecae6}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "%{F#d2de38}󱚼 %{u-} Disconnected"
fi
