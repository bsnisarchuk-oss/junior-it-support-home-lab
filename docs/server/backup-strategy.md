# Backup Strategy (Planned)

**Status:** future lab phase. Backup automation is not yet documented as complete in the current live lab.

---

## Current Position

The live lab already has a working Samba share, but the backup workflow still needs to be configured, tested, and documented from the actual server.

Until that happens, this file should be treated as a **planning guide**, not a completed implementation record.

---

## Planned Approach

The intended backup flow is:

- back up the local directory behind the `companydocs` Samba share
- store dated backups on the Ubuntu server
- schedule the job with `cron`
- keep a simple log for validation and troubleshooting

---

## Important Documentation Gap

Before using the backup script in `scripts/linux/backup-docs.sh`, record the live server-side source path for the current `companydocs` share.

That path is not guessed in this repository yet and should be captured directly from the running server configuration.

---

## Planned Implementation Checklist

- [ ] identify and document the live source directory for `companydocs`
- [ ] review and update `scripts/linux/backup-docs.sh` with the real source path
- [ ] copy the reviewed script to the server
- [ ] run the script manually and verify the output
- [ ] schedule the job with `cron`
- [ ] capture real evidence after a successful run

---

## Planned Verification

When this phase is completed later, document:

- the exact backup source path
- the exact backup destination path
- the cron entry that was used
- the log location
- the evidence screenshots captured from the live server

See also: `docs/incidents/planned/backup-job-failure.md`
