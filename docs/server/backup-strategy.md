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

## Current Script Alignment

The helper script in `scripts/linux/backup-docs.sh` now uses `/srv/companydocs` as its default source path so it matches the documented lab layout behind the `companydocs` share.

That change improves consistency in the repository, but it still does **not** mean backup automation has already been deployed or validated on `office-srv-01`.

---

## Planned Implementation Checklist

- [ ] confirm the live source directory for `companydocs` directly from the server
- [ ] review `scripts/linux/backup-docs.sh` again before deploying it on the server
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
