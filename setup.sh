#!/bin/bash

# Set this to YOUR USERNAME
username=""

# Upgrade
apt-get update
apt-get upgrade -y

# Install DE & drivers
apt-get install cage sddm konsole meta-utils vulkan-tools mesa-vulkan-drivers -y

# SDDM setup
cat <<EOF >> /etc/sddm.conf
[Autologin]
User=$username
Session=es-de
EOF

# ES-DE + Cage setup
cat <<EOF >> /usr/share/wayland-sessions/es-de.desktop
[Desktop Entry]
Name=Emulationstation Desktop Edition
Comment=Starts ES-DE in the Cage wayland compositor
Exec=/usr/bin/cage -r /usr/bin/es-de
Type=Application
EOF

# Flatpak
apt-get install flatpak -y

sudo -u $username flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo -u $username flatpak install --assumeyes flathub com.github.tchx84.Flatseal

# ES-DE
apt-get install build-essential clang-format git cmake gettext libharfbuzz-dev libicu-dev libsdl2-dev libavcodec-dev libavfilter-dev libavformat-dev libavutil-dev libfreeimage-dev libfreetype6-dev libgit2-dev libcurl4-openssl-dev libpugixml-dev libasound2-dev libgl1-mesa-dev libpoppler-cpp-dev -y

git clone https://gitlab.com/es-de/emulationstation-de.git

cd emulationstation-de

git checkout stable-3.1

cmake .
make -j8

make install

cd ..

# Emulators
apt-get install retroarch -y
sudo -u $username flatpak install --assumeyes flathub org.ppsspp.PPSSPP
sudo -u $username flatpak install --assumeyes flathub org.duckstation.DuckStation
sudo -u $username flatpak install --assumeyes flathub org.DolphinEmu.dolphin-emu
sudo -u $username flatpak install --assumeyes flathub org.ryujinx.Ryujinx
sudo -u $username flatpak install --assumeyes flathub org.mamedev.MAME

# Portmaster
wget https://github.com/PortsMaster/PortMaster-GUI/releases/download/2024.12.16-1112/Install.PortMaster.sh
./Install.PortMaster.sh

# Steam & box86 & box64
./box86_64_steam.sh

# Desktop files for emulators
sudo -u $username ./setup_desktop_files.sh

# Fan controls - does not work yet
# git clone https://github.com/Luxvao/rp5-fan-control

# echo EDIT THE FAN SCRIPT BEFORE INSTALLATION


