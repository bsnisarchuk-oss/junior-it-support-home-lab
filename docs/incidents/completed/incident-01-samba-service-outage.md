# Incident 01 - Samba Service Outage

**Type:** completed live lab incident  
**Status:** resolved with evidence

---

## Summary

The Windows workstation lost access to `\\192.168.56.101\companydocs` because the Samba service was stopped on the Ubuntu server.

---

## Symptoms

- Windows could not open `\\192.168.56.101\companydocs`
- A network access error was shown on the workstation
- The server still responded to `ping 192.168.56.101`

---

## Root Cause

The Samba service (`smbd`) was stopped on `office-srv-01`.

---

## Fix Applied

The service was started again on the Ubuntu server:

```bash
sudo systemctl start smbd
sudo systemctl status smbd
```

---

## Validation After Fix

- `smbd` returned to `active (running)`
- The Windows workstation could open `\\192.168.56.101\companydocs` again

---

## Related Evidence

- `screenshots/incidents/incident_01/01-before-incident-share-working.png`
- `screenshots/incidents/incident_01/02-smbd-stopped-on-server.png`
- `screenshots/incidents/incident_01/03-windows-cannot-open-share.png`
- `screenshots/incidents/incident_01/04-ping-server-success.png`
- `screenshots/incidents/incident_01/05-smbd-running-again.png`
- `screenshots/incidents/incident_01/06-share-restored-after-fix.png`
