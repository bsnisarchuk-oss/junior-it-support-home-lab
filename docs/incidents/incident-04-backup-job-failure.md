# Incident 04 — Backup Job Failure

## Details

| Field       | Value                        |
|-------------|------------------------------|
| Date        |                              |
| Reporter    |                              |
| Affected    | ubuntu-server                |
| Priority    | High                         |
| Status      | Open / Resolved              |

## Description

Scheduled backup job did not run or completed with errors.

## Investigation Steps

1. Check backup log: `tail -50 /var/log/backup.log`
2. Check cron job is configured: `crontab -l`
3. Check cron service is running: `sudo systemctl status cron`
4. Check script is executable: `ls -l /opt/scripts/backup-docs.sh`
5. Run script manually to test: `sudo /opt/scripts/backup-docs.sh`
6. Check disk space on backup destination: `df -h /srv/backups`

## Root Cause

_Fill in after investigation_

## Resolution

_Fill in steps taken to resolve_

## Prevention

_Fill in any preventive measures_

## Time to Resolve

_Fill in_
