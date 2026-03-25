# Incident Documentation

This folder is reserved for **real incident simulations and troubleshooting notes** from the lab.

The files here should support portfolio credibility, so no incident should be marked as completed unless it was actually reproduced, investigated, fixed, and validated in the live lab.

---

## Current Status

The repository currently contains incident scenario documents for future manual lab work:

| Incident | File | Current Status |
|----------|------|----------------|
| No internet access on workstation | `incident-01-no-internet.md` | Scenario prepared |
| Shared folder inaccessible | `incident-02-shared-folder-inaccessible.md` | Scenario prepared |
| Software installation failure | `incident-03-software-installation-failure.md` | Scenario prepared |
| Backup job failure | `incident-04-backup-job-failure.md` | Blocked until backup automation exists |

---

## Intended Format for Each Incident

Each incident document should stay lightweight and use the same structure:

1. **Incident title**
2. **Symptoms**
3. **Affected system**
4. **Troubleshooting steps**
5. **Root cause**
6. **Fix applied**
7. **Validation after fix**
8. **Related screenshots**

This keeps the incident write-ups easy to review and easy to compare across different scenarios.

---

## Working Rules

- do not mark an incident as resolved unless the work was actually done in the live lab
- keep expected outcomes separate from real findings if the incident has not been run yet
- add screenshots only after manual validation
- store related evidence in `screenshots/incidents/`
- update the incident file after the test, not before it

---

## Template

Use the reusable template in `templates/incident-template.md` when creating a new incident report or upgrading a planned scenario into a completed one.
