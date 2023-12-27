#/bin/sh

title="$(playerctl metadata title -s | cut -c1-15)"
artist="$(playerctl metadata artist -s | cut -c1-10)";
player="$(playerctl metadata --format "{{playerName}}" -s | cut -c1-7)"

if [ "$player" = spotify ]; then
	plays=" "
fi
if [ "$player" = chromiu ]; then
	plays=" "
fi
if [ "$player" = "firefox" ]; then
	plays=" "
fi


if [ -z "$title" ]; then
    echo "Nothing's playing"
elif [[ -z "$title" && -z "$artist" ]]; then
	echo "Nothings's playing"
elif [ -z "$artist" ]; then
	echo $plays $title
else
    echo "$plays $title | $artist"
fi
