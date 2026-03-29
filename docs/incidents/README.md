# Incident Documentation

This folder now separates **completed live incidents** from **future scenarios** so the repository stays clear about what was actually reproduced in the lab and what is still planned.

The completed incident reports are the portfolio evidence. Planned scenarios remain useful for future lab work, but they should never be confused with finished incidents.

---

## Completed Incidents

The files below describe incidents that were actually reproduced, investigated, fixed, and validated in the live lab:

| Incident | File | Status | Evidence |
|----------|------|--------|----------|
| Incident 01 - Samba service outage | `completed/incident-01-samba-service-outage.md` | Resolved | `screenshots/incidents/incident_01/` |
| Incident 02 - Wrong share name in `smb.conf` | `completed/incident-02-wrong-share-name-in-smb-conf.md` | Resolved | `screenshots/incidents/incident_02/` |
| Incident 03 - Shared folder permissions issue | `completed/incident-03-shared-folder-permissions-issue.md` | Resolved | `screenshots/incidents/incident_03/` |
| Incident 04 - Firewall blocks SMB access | `completed/incident-04-firewall-blocks-smb-access.md` | Resolved | `screenshots/incidents/incident_04/` |

---

## Planned Future Scenarios

The files below are still planning documents and should only be upgraded after real manual testing:

| Scenario | File | Current State |
|----------|------|---------------|
| No internet access on workstation | `planned/no-internet-on-workstation.md` | Planned |
| Software installation failure | `planned/software-installation-failure.md` | Planned |
| Backup job failure | `planned/backup-job-failure.md` | Blocked until backup automation exists |

---

## Archived Notes

The file below is kept only as an older generic planning note and is no longer the source of truth for the current incident catalogue:

- `archive/shared-folder-access-troubleshooting-overview.md`

---

## Working Rules

- do not mark an incident as resolved unless the work was actually done in the live lab
- keep expected outcomes separate from real findings if the incident has not been run yet
- add screenshots only after manual validation
- store related evidence in `screenshots/incidents/`
- update the incident file after the test, not before it
- keep incident numbering reserved for completed incident reports only

---

## Template

Use the reusable template in `templates/incident-template.md` when creating a new incident report or upgrading a planned scenario into a completed one.
