# Incident 04 — Backup Job Failure

> **Type:** Lab simulation — this incident is reproduced intentionally to practice troubleshooting.
> **⚙️ Status:** Scenario defined — must be reproduced and resolved manually in the lab.

---

## Incident Details

| Field | Value |
|-------|-------|
| Incident ID | INC-004 |
| Date reported | _(fill in during lab session)_ |
| Reported by | Self-detected during log review |
| Affected device | ubuntu-server |
| Priority | High — data protection at risk |
| Status | ⚙️ To be completed in lab |

---

## Description

During routine log review, it is noticed that no backup has run for several days.
The last entry in `/var/log/backup.log` is from several days ago.
No error notification was configured, so the failure went undetected.

---

## How to Reproduce This Incident in the Lab

> ⚙️ **Choose one of the methods below to break the backup:**

**Method A — Remove execute permission from the script:**
```bash
# On the Ubuntu Server
sudo chmod -x /opt/scripts/backup-docs.sh
```
The cron job will fail silently because the script can't be executed.

**Method B — Corrupt the cron job:**
```bash
crontab -e
# Change the path to a wrong path:
# 0 2 * * * /opt/scripts/backup-WRONG.sh >> /var/log/backup.log 2>&1
```

**Method C — Fill up the backup destination (simulate full disk):**
```bash
# Create a large dummy file to fill disk space
dd if=/dev/zero of=/srv/backups/fillfile bs=1M count=4000
```

---

## Investigation Steps

### Step 1 — Check when the last backup ran

```bash
tail -30 /var/log/backup.log
```

Look at the timestamps of the last entries.
If the log is empty or has no recent entries → backup is not running.

### Step 2 — Check if the cron job exists

```bash
crontab -l
```

Expected output should include:
```
0 2 * * * /opt/scripts/backup-docs.sh >> /var/log/backup.log 2>&1
```

If this line is missing → the cron job was deleted or never created.

### Step 3 — Check if the cron service is running

```bash
sudo systemctl status cron
```

Expected: `active (running)`
If not running:
```bash
sudo systemctl start cron
sudo systemctl enable cron
```

### Step 4 — Check if the script exists and is executable

```bash
ls -l /opt/scripts/backup-docs.sh
```

Expected output:
```
-rwxr-xr-x 1 root root ... backup-docs.sh
```

- If the file is not there → script was deleted or never copied
- If permissions show `-rw-r--r--` (no `x`) → script is not executable

Fix:
```bash
sudo chmod +x /opt/scripts/backup-docs.sh
```

### Step 5 — Run the script manually to test

```bash
sudo /opt/scripts/backup-docs.sh
```

If this fails, the output will show the error directly.
Common errors:
- `Permission denied` → fix permissions (Step 4)
- `No such file or directory` → wrong path in cron or script deleted
- `rsync: error` → rsync not installed, or source/destination doesn't exist
- `df -h /srv/backups` → check if disk is full

### Step 6 — Check disk space

```bash
df -h /srv/backups
df -h /srv/shared
```

If usage is near 100% → clean up old backups or the dummy fill file:
```bash
sudo rm /srv/backups/fillfile
```

---

## Root Cause

> ⚙️ Fill in after completing the lab investigation.

**Expected root cause (Method A):** The execute permission was removed from `/opt/scripts/backup-docs.sh`. When cron attempted to run the script at 02:00, the shell returned "Permission denied" and the script did not execute. No error email was configured, so the failure was silent.

_Actual finding during lab:_
```
[fill in]
```

---

## Resolution

> ⚙️ Fill in after completing the lab resolution.

**Expected resolution (Method A):**
```bash
# Restore execute permission
sudo chmod +x /opt/scripts/backup-docs.sh

# Run manually to confirm it works
sudo /opt/scripts/backup-docs.sh

# Verify backup created
ls -lh /srv/backups/

# Check log
tail -10 /var/log/backup.log
```

**To prevent silent failures in future — add cron error notification:**
```bash
crontab -e
# Add MAILTO at the top (requires mail configured, optional in lab):
# MAILTO="admin@localhost"
```

Or add a simple health check:
```bash
# Add to the end of backup-docs.sh
if [ $? -ne 0 ]; then
    echo "[ERROR] Backup failed at $(date)" >> /var/log/backup.log
fi
```

_Actual steps taken during lab:_
```
[fill in]
```

---

## Screenshots to Take

- [ ] `screenshots/incidents/inc-004-empty-log.png` — backup log showing no recent entries
- [ ] `screenshots/incidents/inc-004-permissions.png` — ls -l showing missing execute bit
- [ ] `screenshots/incidents/inc-004-manual-run.png` — script running successfully after fix
- [ ] `screenshots/incidents/inc-004-backup-created.png` — /srv/backups showing new backup directory

---

## Prevention

- Always set scripts as executable immediately after creation: `chmod +x script.sh`
- Configure cron failure alerts (email or log monitoring)
- Regularly review backup logs — add this to a weekly checklist
- Monitor disk space: add a disk usage check to the backup script

---

## Time to Resolve

| Stage | Time |
|-------|------|
| Time reported → first investigation | _(fill in)_ |
| First investigation → root cause identified | _(fill in)_ |
| Root cause → resolved | _(fill in)_ |
| **Total** | _(fill in)_ |
