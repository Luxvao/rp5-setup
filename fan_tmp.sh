#!/bin/bash

# Fan stop script
cat <<EOF >> /sbin/stop_fan.sh
#!/bin/bash

echo 30 > /sys/class/hwmon/hwmon0/pwm1
EOF

# Permissions
chmod +x /sbin/stop_fan.sh

# Create a systemd service that silences the fan
cat <<EOF >> /etc/systemd/system/fan.service
[Unit]
Description=Silences the RP5 fan
DefaultDependencies=no
Before=basic.target
After=local-fs.target

[Service]
Type=simple
ExecStart=/sbin/stop_fan.sh
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
