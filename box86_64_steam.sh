#!/bin/bash

# Box86 installer
# check if .list file already exists
if [ -f /etc/apt/sources.list.d/box86.list ]; then
  sudo rm -f /etc/apt/sources.list.d/box86.list || exit 1
fi
# check if .sources file already exists
if [ -f /etc/apt/sources.list.d/box86.sources ]; then
  sudo rm -f /etc/apt/sources.list.d/box86.sources || exit 1
fi
# download gpg key from specified url
if [ -f /usr/share/keyrings/box86-archive-keyring.gpg ]; then
  sudo rm -f /usr/share/keyrings/box86-archive-keyring.gpg
fi
sudo mkdir -p /usr/share/keyrings
wget -qO- "https://pi-apps-coders.github.io/box86-debs/KEY.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/box86-archive-keyring.gpg
# create .sources file
echo "Types: deb
URIs: https://Pi-Apps-Coders.github.io/box86-debs/debian
Suites: ./
Signed-By: /usr/share/keyrings/box86-archive-keyring.gpg" | sudo tee /etc/apt/sources.list.d/box86.sources >/dev/null

# Actually install it
dpkg --add-architecture armhf
apt-get update
apt-get install libc6:armhf libz-dev:armhf libpng-dev:armhf libssl-dev:armhf libcurl4-openssl-dev:armhf -y
apt-get install box86-generic-arm:armhf -y



# Box64 installer
# check if .list file already exists
if [ -f /etc/apt/sources.list.d/box64.list ]; then
  sudo rm -f /etc/apt/sources.list.d/box64.list || exit 1
fi

# check if .sources file already exists
if [ -f /etc/apt/sources.list.d/box64.sources ]; then
  sudo rm -f /etc/apt/sources.list.d/box64.sources || exit 1
fi

# download gpg key from specified url
if [ -f /usr/share/keyrings/box64-archive-keyring.gpg ]; then
  sudo rm -f /usr/share/keyrings/box64-archive-keyring.gpg
fi
sudo mkdir -p /usr/share/keyrings
wget -qO- "https://pi-apps-coders.github.io/box64-debs/KEY.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/box64-archive-keyring.gpg

# create .sources file
echo "Types: deb
URIs: https://Pi-Apps-Coders.github.io/box64-debs/debian
Suites: ./
Signed-By: /usr/share/keyrings/box64-archive-keyring.gpg" | sudo tee /etc/apt/sources.list.d/box64.sources >/dev/null

# Actually install it
apt update
apt install box64-generic-arm -y



# Steam
git clone https://github.com/ptitSeb/box86
./box86/install_steam.sh
