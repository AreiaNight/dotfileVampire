#!/bin/bash

# Actualizar el sistema e instalar dependencias
sudo apt update
sudo apt install -y xorg bspwm sxhkd rxvt-unicode feh compton

# Instalar kitty o actualizar a la última versión
if command -v kitty &>/dev/null; then
    echo "Kitty ya está instalado. Actualizando a la última versión..."
    sudo apt remove --purge kitty
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
else
    echo "Instalando kitty..."
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

# Agregar kitty al directorio bin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
source ~/.profile

# Crear el archivo de configuración para kitty
mkdir -p ~/.config/kitty
echo "font_family   JetBrains Mono" >> ~/.config/kitty/kitty.conf
echo "font_size 11.0" >> ~/.config/kitty/kitty.conf
echo "background_opacity 0.9" >> ~/.config/kitty/kitty.conf

# Instalar otras herramientas útiles (puedes agregar más si lo deseas)
sudo apt install -y dmenu rofi lxappearance nitrogen

# Configurar compton para la transparencia
mkdir -p ~/.config/compton
echo "backend = \"glx\";
glx-no-stencil = true;
glx-no-rebind-pixmap = true;
vsync = \"opengl-swc\";" >> ~/.config/compton.conf

# Configurar BSPWM
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc

# Configurar el administrador de ventanas predeterminado
echo "exec bspwm" > ~/.xinitrc

echo "Instalación completa. Por favor, reinicia tu sistema o inicia una nueva sesión para utilizar BSPWM con kitty."
