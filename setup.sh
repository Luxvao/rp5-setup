#!/bin/bash

username=""

# Upgrade
apt-get update
apt-get upgrade

# Install DE
apt-get install plasma-mobile plasma-mobile-tweaks sddm konsole -y

# SDDM setup
cat <<EOF >> /etc/sddm.conf
[Autologin]
User=$username
Session=plasma-mobile
EOF

# Flatpak
apt-get install flatpak -y
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

# Fan controls - does not work yet
# git clone https://github.com/Luxvao/rp5-fan-control

# echo EDIT THE FAN SCRIPT BEFORE INSTALLATION


