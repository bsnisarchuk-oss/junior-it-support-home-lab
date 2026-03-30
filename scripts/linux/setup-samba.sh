#!/bin/bash
# setup-samba.sh - Install and configure the companydocs Samba share

set -e

# Defaults aligned to the current documented lab layout.
# Review ownership and access choices before using this outside the lab.
SHARE_DIR="${SHARE_DIR:-/srv/companydocs}"
SHARE_NAME="${SHARE_NAME:-companydocs}"
SHARE_OWNER="${SHARE_OWNER:-nobody}"
SHARE_GROUP="${SHARE_GROUP:-nogroup}"
SHARE_MODE="${SHARE_MODE:-0775}"

echo "[INFO] Installing Samba..."
apt-get update -y
apt-get install -y samba

echo "[INFO] Creating share root: $SHARE_DIR"
mkdir -p "$SHARE_DIR"
chown "$SHARE_OWNER:$SHARE_GROUP" "$SHARE_DIR"
chmod "$SHARE_MODE" "$SHARE_DIR"

echo "[INFO] Configuring Samba..."
SMB_CONF="/etc/samba/smb.conf"

# Backup original config once
if [ ! -f "${SMB_CONF}.bak" ]; then
    cp "$SMB_CONF" "${SMB_CONF}.bak"
fi

# Add share config if not already present
if ! grep -q "^\[$SHARE_NAME\]" "$SMB_CONF"; then
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

echo "[INFO] Validating Samba config..."
testparm -s >/dev/null

echo "[INFO] Restarting Samba..."
systemctl restart smbd
systemctl enable smbd

if command -v ufw >/dev/null 2>&1; then
    echo "[INFO] UFW detected. Adding Samba allow rule if needed..."
    ufw allow samba || true
else
    echo "[INFO] UFW not detected. Skipping firewall rule step."
fi

echo "[INFO] Share root ready. Run create-shared-structure.sh to add the documented Shared subfolder layout."
echo "[DONE] Samba configured. Access at: \\\\$(hostname -I | awk '{print $1}')\\$SHARE_NAME"
