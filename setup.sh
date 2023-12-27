#!/bin/bash

echo "Verificando rutas"

# Verificando las carpetas necesarias
if [ -d "$HOME/.config/polybar" ]; then
    echo "Eliminando polybar"
    sudo rm -r "$HOME/.config/polybar"
elif [ -d "$HOME/.config/bin" ]; then
    echo "Eliminando bin"
    sudo rm -r "$HOME/.config/bin"
elif [ -d "$HOME/.config/picom" ]; then
    echo "Eliminando picom"
    sudo rm -r "$HOME/.config/picom"
fi

echo -e "\nCreando carpetas y pegando archivos\n"

# Crear directorios con la opción -p para crear padres si no existen
mkdir -p "$HOME/.config/polybar"
mkdir -p "$HOME/.config/bin"
mkdir -p "$HOME/.config/picom"

# Dar permisos a los archivos
chmod +x launch.sh ethernet_ip.sh ovpn_htb_ip.sh victimip.sh

# Copiar archivos a los directorios adecuados
cp colors.ini modules.ini config.ini launch.sh "$HOME/.config/polybar"
cp ethernet_ip.sh ovpn_htb_ip.sh victimip.sh target "$HOME/.config/bin"
cp picom "$HOME/.config/picom"

# Agregar comandos al archivo bspwmrc
echo "$HOME/.config/polybar/./launch.sh" >> "$HOME/.config/bspwm/bspwmrc"
echo "picom" >> "$HOME/.config/bspwm/bspwmrc"

# Actualizar paquetes
sudo apt update 
sudo apt upgrade 

echo -e "\nPor favor reinicie bspwm para ver los cambios\n"
