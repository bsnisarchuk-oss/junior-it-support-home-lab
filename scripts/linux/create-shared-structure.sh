#!/bin/bash
# create-shared-structure.sh - Create folder structure inside the shared directory

set -e

# Template default only. Review before using in the live lab.
SHARE_DIR="${SHARE_DIR:-/srv/shared}"

echo "[INFO] Creating shared folder structure in $SHARE_DIR..."

mkdir -p "$SHARE_DIR/Documents"
mkdir -p "$SHARE_DIR/IT/Drivers"
mkdir -p "$SHARE_DIR/IT/Software"
mkdir -p "$SHARE_DIR/IT/Scripts"
mkdir -p "$SHARE_DIR/HR"
mkdir -p "$SHARE_DIR/Public"

# Set permissions
chmod -R 0775 "$SHARE_DIR"
chown -R nobody:nogroup "$SHARE_DIR"

echo "[DONE] Shared folder structure created:"
find "$SHARE_DIR" -type d
