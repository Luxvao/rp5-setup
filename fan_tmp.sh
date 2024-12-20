#!/bin/bash

# Stop fan
echo 30 > /sys/class/hwmon/hwmon0/pwm1

# Create a systemd service that silences the fan
cat <<EOF >> /etc/systemd/system/fan.service
[Unit]
Description=Silences the RP5 fan
DefaultDependencies=no
Before=basic.target
After=local-fs.target

[Service]
Type=simple
ExecStart=echo 30 > /sys/class/hwmon/hwmon0/pwm1
Restart=no
User=root
Group=root

[Install]
WantedBy=basic.target
EOF

# Reload daemon
systemctl daemon-reload

# Enable & start the service
systemctl enable --now fan
