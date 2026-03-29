# Future Scenario - Backup Job Failure

**Type:** planned future scenario  
**Status:** blocked until backup automation exists in the live lab

---

## Scenario Goal

This incident is reserved for a later phase of the project.

It should only be used after a real backup job has been configured, tested, and documented on `office-srv-01`.

---

## Planned Reproduction Ideas

After backup automation exists, possible break methods include:

- removing execute permission from the backup script
- breaking the cron entry
- making the backup destination unavailable

If you use the script template in `scripts/linux/backup-docs.sh`, record the real deployed path and real log path before running the incident.

---

## Planned Investigation Steps

When this incident becomes valid later, check:

```bash
crontab -l
sudo systemctl status cron
ls -l <deployed-backup-script>
tail -30 <backup-log-path>
```

Then test the job manually:

```bash
sudo <deployed-backup-script>
```

---

## Likely Resolution

The exact fix will depend on the actual failure, but common paths are:

- restore execute permission to the script
- fix the cron entry
- restore the backup destination path
- rerun the backup manually and confirm the log updates

---

## Evidence To Capture Later

- [ ] `screenshots/incidents/inc-004-empty-log.png`
- [ ] `screenshots/incidents/inc-004-script-check.png`
- [ ] `screenshots/incidents/inc-004-manual-run.png`
- [ ] `screenshots/incidents/inc-004-resolved.png`

---

## Blocking Requirement

Before this incident can be used, the repo still needs:

- a documented live backup design
- a tested backup script on `office-srv-01`
- a documented backup log location
