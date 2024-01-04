#!/bin/bash

# Actualizar el sistema e instalar dependencias
sudo apt update
sudo apt install -y xorg bspwm sxhkd rxvt-unicode feh compton

# Instalando dependencias de Entorno

sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

#Instalando Requerimientos para la polybar

sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev

# Dependencias de Picom

sudo apt install -y meson picom libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev

# Paquetes adicionales
sudo apt install -y feh  rofi xclip  locate ranger neofetch wmname imagemagick cmatrix


# Configurar el gestor de ventanas BSPWM y SXHKD
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod +x ~/.config/bspwm/bspwmrc

# Instalar otras herramientas útiles (puedes agregar más si lo deseas)
sudo apt install -y dmenu rofi lxappearance nitrogen

# Configurar compton para la transparencia
mkdir -p ~/.config/compton
echo "backend = \"glx\";
glx-no-stencil = true;
glx-no-rebind-pixmap = true;
vsync = \"opengl-swc\";" >> ~/.config/compton.conf

# Instalar el administrador de ventanas predeterminado
echo "exec bspwm" > ~/.xinitrc

echo "Instalación completa. Por favor, reinicia tu sistema o inicia una nueva sesión para utilizar BSPWM."

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

# Instalando Polybar

cd ~/github/polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

# Instalando Picom

cd ~/github/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# Instalando p10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Instalando p10k root

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k

# Plugins ZSH

sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions
sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh




sudo apt install -y bspwm sxhkd rofi kitty picom calcurse todo-txt \
 feh jq dunst betterlockscreen brightnessctl playerctl maim \
 xclip imagemagick



sudo apt-get update
sudo apt-get install -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone https://github.com/elkowar/eww.git ~/.config/eww

cd ~/.config/eww

cargo build --release
cargo install --path .

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo apt-get install -y pkg-config libglib2.0-dev

rustup update

cargo clean
cargo build
