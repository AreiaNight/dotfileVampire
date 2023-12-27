# /bin/bash

stat="$(playerctl status -s)"

if [[ $stat == "Playing" ]]; then
	echo "  "
elif [[ $stat == "Paused" ]]; then
	echo "  "
else
	echo "  "
fi
