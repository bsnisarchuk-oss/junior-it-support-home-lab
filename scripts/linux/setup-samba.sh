#!/bin/bash
# setup-samba.sh — Install and configure Samba shared folder

set -e

SHARE_DIR="/srv/shared"
SHARE_NAME="Shared"

echo "[INFO] Installing Samba..."
apt-get update -y
apt-get install -y samba

echo "[INFO] Creating shared directory: $SHARE_DIR"
mkdir -p "$SHARE_DIR"
chown -R nobody:nogroup "$SHARE_DIR"
chmod 0775 "$SHARE_DIR"

echo "[INFO] Configuring Samba..."
SMB_CONF="/etc/samba/smb.conf"

# Backup original config
cp "$SMB_CONF" "${SMB_CONF}.bak"

# Add share config if not already present
if ! grep -q "\[$SHARE_NAME\]" "$SMB_CONF"; then
    cat >> "$SMB_CONF" <<EOF

[$SHARE_NAME]
   path = $SHARE_DIR
   browseable = yes
   read only = no
   guest ok = yes
   create mask = 0664
   directory mask = 0775
EOF
fi

echo "[INFO] Restarting Samba..."
systemctl restart smbd
systemctl enable smbd

echo "[INFO] Allowing Samba through firewall..."
ufw allow samba

echo "[DONE] Samba configured. Access at: \\\\$(hostname -I | awk '{print $1}')\\$SHARE_NAME"
