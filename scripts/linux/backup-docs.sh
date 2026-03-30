#!/bin/bash
# backup-docs.sh - Backup the current documented companydocs layout

set -euo pipefail

# These defaults match the documented lab layout, but the repo does not
# yet claim that backup automation has been deployed and validated on the server.
SOURCE_DIR="${SOURCE_DIR:-/srv/companydocs}"
BACKUP_BASE="${BACKUP_BASE:-/srv/backups/companydocs}"
RETENTION_DAYS="${RETENTION_DAYS:-7}"
DATE=$(date +%Y-%m-%d)
BACKUP_DIR="$BACKUP_BASE/$DATE"

if ! command -v rsync >/dev/null 2>&1; then
    echo "[ERROR] rsync is required but not installed."
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "[ERROR] Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

echo "[INFO] Starting backup: $DATE"
echo "[INFO] Source: $SOURCE_DIR"
echo "[INFO] Destination: $BACKUP_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Perform backup using rsync
rsync -av --delete "$SOURCE_DIR/" "$BACKUP_DIR/"

echo "[INFO] Backup completed successfully."

# Remove backups older than retention period
echo "[INFO] Removing backups older than $RETENTION_DAYS days..."
find "$BACKUP_BASE" -mindepth 1 -maxdepth 1 -type d -name "20[0-9][0-9]-[0-1][0-9]-[0-3][0-9]" -mtime +$RETENTION_DAYS -exec rm -rf {} +

echo "[INFO] Remaining backups:"
ls -1 "$BACKUP_BASE"

echo "[DONE] Backup job finished at $(date)"
