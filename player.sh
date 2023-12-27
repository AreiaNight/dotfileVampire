#!/bin/bash

# Obtener el estado de reproducción actual
player_status=$(playerctl status 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
    # Obtiene el título de la canción en reproducción
    title=$(playerctl metadata title)
    echo "$title"
else
    echo " No music  "
fi
