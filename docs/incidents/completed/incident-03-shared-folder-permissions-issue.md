# Incident 03 - Shared Folder Permissions Issue

**Type:** completed live lab incident  
**Status:** resolved with evidence

---

## Summary

Write access failed on the `Shared` subfolder inside the `companydocs` share even though the share remained reachable and Samba stayed healthy.

---

## Symptoms

- Windows could browse the share successfully
- Creating a new file in `\\192.168.56.101\companydocs\Shared` returned a permissions error
- `smbd` remained active and running

---

## Root Cause

Incorrect Linux permissions were applied to `/srv/companydocs/Shared`, changing the directory from `0775` to `0555`.

---

## Fix Applied

Write permissions were restored on the Linux directory:

```bash
sudo chmod 0775 /srv/companydocs/Shared
```

---

## Validation After Fix

- Write access to `\\192.168.56.101\companydocs\Shared` was restored
- `incident03-restored.txt` was successfully created from the Windows workstation

---

## Related Evidence

- `screenshots/incidents/incident_03/01-ubuntu-shared-permissions-restored.png` shows `chmod`, `ls -ld`, `stat`, and `systemctl status smbd` after recovery
- `screenshots/incidents/incident_03/02-windows-write-success-after-permissions-fix.png` shows the restored Windows write test and `incident03-restored.txt`

## Evidence Note

This incident currently has a smaller screenshot set than the other completed incidents and focuses mainly on recovery plus post-fix validation.

If the scenario is recreated safely later, the evidence would be stronger with:

- the pre-fix Linux permissions state before recovery
- the Windows-side write failure before permissions were restored
