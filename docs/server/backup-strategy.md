# Backup Strategy

## Overview

Automated daily backups of shared folder contents to a local backup directory.

## Backup Schedule

| Backup Type | Frequency | Retention | Script              |
|-------------|-----------|-----------|---------------------|
| Full        | Daily     | 7 days    | `backup-docs.sh`    |

## Backup Script

See `scripts/linux/backup-docs.sh`

## Cron Job Setup

```bash
crontab -e
```

Add:
```
0 2 * * * /opt/scripts/backup-docs.sh >> /var/log/backup.log 2>&1
```

This runs daily at 02:00.

## Backup Verification

```bash
# List recent backups
ls -lh /srv/backups/

# Check log
tail -20 /var/log/backup.log
```

## Recovery Procedure

```bash
# Restore from backup
cp -r /srv/backups/YYYY-MM-DD/* /srv/shared/
```

## Incident Reference

See `docs/incidents/incident-04-backup-job-failure.md` for backup failure troubleshooting.
