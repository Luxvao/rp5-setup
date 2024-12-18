#!/bin/bash

# This will run automatically as the non-root user

# ROMs directory
mkdir ~/ROMs
mkdir ~/ROMs/desktop

# Retroarch
cat <<EOF >> ~/ROMs/desktop/Retroarch.desktop
[Desktop Entry]
Name=Retroarch
Comment=Launches Retroarch
Exec=retroarch -f
Type=Application
EOF

# PPSSPP
cat <<EOF >> ~/ROMs/desktop/PPSSPP.desktop
[Desktop Entry]
Name=PPSSPP
Comment=Launches PPSSPP
Exec=flatpak run org.ppsspp.PPSSPP
Type=Application
EOF

# Dolphin
cat <<EOF >> ~/ROMs/desktop/Dolphin.desktop
[Desktop Entry]
Name=Dolphin
Comment=Launches Dolphin
Exec=flatpak run org.DolphinEmu.dolphin-emu
Type=Application
EOF

# Duckstation
cat <<EOF >> ~/ROMs/desktop/Duckstation.desktop
[Desktop Entry]
Name=Duckstation
Comment=Launches Duckstation
Exec=flatpak run org.duckstation.DuckStation
Type=Application
EOF
