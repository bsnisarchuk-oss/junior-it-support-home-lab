#!/bin/bash
# create-shared-structure.sh - Create the documented companydocs folder layout

set -e

# Defaults aligned to the current documented lab layout.
SHARE_ROOT="${SHARE_ROOT:-/srv/companydocs}"
SHARE_OWNER="${SHARE_OWNER:-nobody}"
SHARE_GROUP="${SHARE_GROUP:-nogroup}"
SHARE_MODE="${SHARE_MODE:-0775}"

echo "[INFO] Creating shared folder structure in $SHARE_ROOT..."

mkdir -p "$SHARE_ROOT/Shared"
mkdir -p "$SHARE_ROOT/IT/Drivers"
mkdir -p "$SHARE_ROOT/IT/Software"
mkdir -p "$SHARE_ROOT/IT/Scripts"
mkdir -p "$SHARE_ROOT/HR"
mkdir -p "$SHARE_ROOT/Public"

# Set permissions
chmod -R "$SHARE_MODE" "$SHARE_ROOT"
chown -R "$SHARE_OWNER:$SHARE_GROUP" "$SHARE_ROOT"

echo "[DONE] Shared folder structure created:"
find "$SHARE_ROOT" -type d | sort
