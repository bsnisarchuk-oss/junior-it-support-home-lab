# Backup Strategy

> **Status:** Guide written, script created — ⚙️ must be tested manually on the Ubuntu Server.
> **Prerequisite:** Samba shared folder is configured at `/srv/shared`.

---

## Overview

Daily automated backup of the Samba shared folder (`/srv/shared`) to a local backup directory (`/srv/backups`).
Uses `rsync` for efficient incremental copying and a `cron` job for scheduling.
Backups older than 7 days are automatically deleted.

---

## Backup Summary

| Setting | Value |
|---------|-------|
| Source | `/srv/shared` |
| Destination | `/srv/backups/YYYY-MM-DD/` |
| Schedule | Daily at 02:00 |
| Retention | 7 days |
| Tool | rsync + cron |
| Log file | `/var/log/backup.log` |

---

## 1. Prepare Backup Directory

> ⚙️ **Run on the server.**

```bash
sudo mkdir -p /srv/backups
sudo mkdir -p /opt/scripts
```

---

## 2. Deploy the Backup Script

Copy the script from the repository to the server:
```bash
sudo cp scripts/linux/backup-docs.sh /opt/scripts/backup-docs.sh
sudo chmod +x /opt/scripts/backup-docs.sh
```

Review the script before running:
```bash
cat /opt/scripts/backup-docs.sh
```

---

## 3. Test the Script Manually

> ⚙️ **Run on the server.**

```bash
sudo /opt/scripts/backup-docs.sh
```

Expected output:
```
[INFO] Starting backup: 2026-03-22
[INFO] Source: /srv/shared
[INFO] Destination: /srv/backups/2026-03-22
[INFO] Backup completed successfully.
[INFO] Remaining backups:
2026-03-22
[DONE] Backup job finished at ...
```

Verify backup was created:
```bash
ls -lh /srv/backups/
ls -lh /srv/backups/$(date +%Y-%m-%d)/
```

**⚙️ Screenshot to take:** Backup output and directory listing → `screenshots/server/backup-manual-run.png`

---

## 4. Schedule with Cron

> ⚙️ **Run on the server.**

Open the crontab editor:
```bash
crontab -e
```

Add this line at the end:
```
0 2 * * * /opt/scripts/backup-docs.sh >> /var/log/backup.log 2>&1
```

This runs the script every day at 02:00 and appends output to the log file.

Verify the cron job was saved:
```bash
crontab -l
```

---

## 5. Monitor Backup Logs

After the first scheduled run:
```bash
# View last 20 lines of backup log
tail -20 /var/log/backup.log

# View all backups stored
ls -lh /srv/backups/
```

**⚙️ Screenshot to take:** Log file showing successful scheduled run → `screenshots/server/backup-log.png`

---

## 6. Recovery Procedure

To restore files from a backup:

```bash
# List available backup dates
ls /srv/backups/

# Restore from a specific date (replace date as needed)
sudo rsync -av /srv/backups/2026-03-22/ /srv/shared/
```

> ⚠️ Restoring overwrites files in `/srv/shared/`. Always confirm the date before restoring.

---

## 7. Verification Checklist

| Check | Command | Expected Result | ⚙️ Result |
|-------|---------|-----------------|----------|
| Script exists | `ls -l /opt/scripts/backup-docs.sh` | File listed, executable | |
| Manual run succeeds | `sudo /opt/scripts/backup-docs.sh` | DONE message, no errors | |
| Backup folder created | `ls /srv/backups/` | Today's date folder exists | |
| Cron job scheduled | `crontab -l` | Line with backup script | |
| Log file exists | `cat /var/log/backup.log` | Backup entries visible | |

---

## Troubleshooting

| Problem | Check | Fix |
|---------|-------|-----|
| Script not found | `ls /opt/scripts/` | Re-copy script to correct path |
| Permission denied | `ls -l /opt/scripts/backup-docs.sh` | `chmod +x` the script |
| rsync not installed | `rsync --version` | `sudo apt install rsync -y` |
| Cron not running | `sudo systemctl status cron` | `sudo systemctl start cron` |
| No log output | `tail /var/log/backup.log` | Check cron job line for syntax |
| Disk full | `df -h /srv/backups` | Reduce retention or expand disk |

See also: `docs/incidents/incident-04-backup-job-failure.md`
