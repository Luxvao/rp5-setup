#!/bin/bash

username=""

# Upgrade
apt-get update
apt-get upgrade

# Install DE
apt-get install plasma-mobile plasma-mobile-tweaks sddm konsole

# SDDM setup
cat <<EOF >> /etc/sddm.conf
[Autologin]
User=$username
Session=plasma-mobile
EOF

# ES-DE
sudo apt-get install build-essential clang-format git cmake gettext libharfbuzz-dev libicu-dev libsdl2-dev libavcodec-dev libavfilter-dev libavformat-dev libavutil-dev libfreeimage-dev libfreetype6-dev libgit2-dev libcurl4-openssl-dev libpugixml-dev libasound2-dev libgl1-mesa-dev libpoppler-cpp-dev

git clone https://gitlab.com/es-de/emulationstation-de.git

cd emulationstation-de

git checkout stable-3.1

cmake .
make -j8

make install

cd ..

# Fan controls
git clone https://github.com/Luxvao/rp5-fan-control

echo EDIT THE FAN SCRIPT BEFORE INSTALLATION


