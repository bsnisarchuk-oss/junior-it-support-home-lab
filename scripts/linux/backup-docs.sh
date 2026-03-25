#!/bin/bash
# backup-docs.sh - Daily backup of shared folder with 7-day retention

set -e

# Template default only. Update to the live server-side path for companydocs before use.
SOURCE_DIR="${SOURCE_DIR:-/srv/shared}"
BACKUP_BASE="/srv/backups"
DATE=$(date +%Y-%m-%d)
BACKUP_DIR="$BACKUP_BASE/$DATE"
RETENTION_DAYS=7

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
find "$BACKUP_BASE" -maxdepth 1 -type d -mtime +$RETENTION_DAYS -exec rm -rf {} \;

echo "[INFO] Remaining backups:"
ls -1 "$BACKUP_BASE"

echo "[DONE] Backup job finished at $(date)"
