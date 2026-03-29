# Incident 02 - Wrong Share Name in smb.conf

**Type:** completed live lab incident  
**Status:** resolved with evidence

---

## Summary

The expected Samba share name was changed in `smb.conf`, so Windows was trying to open a share path that no longer existed.

---

## Symptoms

- `ping 192.168.56.101` succeeded
- `smbd` remained active and running
- Windows could not open `\\192.168.56.101\companydocs`

---

## Root Cause

The original share `[companydocs]` was temporarily renamed to `[companydocs_disabled]` in the Samba configuration.

---

## Fix Applied

The original share name `[companydocs]` was restored in `smb.conf`, returning the configuration to the expected baseline.

---

## Validation After Fix

- `\\192.168.56.101\companydocs` became accessible again
- Normal shared-folder access was restored from the Windows workstation

---

## Related Evidence

- `screenshots/incidents/incident_02/01-share-working-before-config-change.png`
- `screenshots/incidents/incident_02/02-share-name-changed-in-config.png`
- `screenshots/incidents/incident_02/03-smbd-running-with-bad-share-config.png`
- `screenshots/incidents/incident_02/04-windows-cannot-find-share.png`
- `screenshots/incidents/incident_02/05-ping-server-success.png`
- `screenshots/incidents/incident_02/06-config-shows-wrong-share-name.png`
- `screenshots/incidents/incident_02/07-share-name-restored-and-smbd-running.png`
- `screenshots/incidents/incident_02/08-share-restored-after-config-fix.png`
