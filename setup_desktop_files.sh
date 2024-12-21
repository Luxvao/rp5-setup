#!/bin/bash

# This will run automatically as the non-root user

# ROMs directory
mkdir ~/ROMs
mkdir ~/ROMs/desktop

# Retroarch
cat <<EOF > ~/ROMs/desktop/RetroArch.desktop
[Desktop Entry]
Name=RetroArch
Comment=Launches RetroArch
Exec=flatpak run org.libretro.RetroArch
Type=Application
EOF

chmod +x ~/ROMs/desktop/RetroArch.desktop

# PPSSPP
cat <<EOF > ~/ROMs/desktop/PPSSPP.desktop
[Desktop Entry]
Name=PPSSPP
Comment=Launches PPSSPP
Exec=flatpak run org.ppsspp.PPSSPP
Type=Application
EOF

chmod +x ~/ROMs/desktop/PPSSPP.desktop

# Dolphin
cat <<EOF > ~/ROMs/desktop/Dolphin.desktop
[Desktop Entry]
Name=Dolphin
Comment=Launches Dolphin
Exec=flatpak run org.DolphinEmu.dolphin-emu
Type=Application
EOF

chmod +x ~/ROMs/desktop/Dolphin.desktop

# Duckstation
cat <<EOF > ~/ROMs/desktop/Duckstation.desktop
[Desktop Entry]
Name=Duckstation
Comment=Launches Duckstation
Exec=flatpak run org.duckstation.DuckStation
Type=Application
EOF

chmod +x ~/ROMs/desktop/Duckstation.desktop
