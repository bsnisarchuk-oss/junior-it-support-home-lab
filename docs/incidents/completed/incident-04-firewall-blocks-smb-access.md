# Incident 04 - Firewall Blocks SMB Access

**Type:** completed live lab incident  
**Status:** resolved with evidence

---

## Summary

SMB access failed because a temporary firewall rule dropped inbound TCP port `445` traffic from the Windows client while the Samba service itself stayed healthy.

---

## Symptoms

- Windows failed to open `\\192.168.56.101\companydocs`
- A network access error was shown
- `smbd` remained `active (running)` on Ubuntu
- TCP port `445` was listening before the temporary firewall block

---

## Root Cause

A temporary `iptables` rule was added on `office-srv-01` to drop inbound TCP traffic on port `445` from `192.168.56.102`.

---

## Fix Applied

The temporary firewall rule was removed:

```bash
sudo iptables -D INPUT -s 192.168.56.102 -p tcp --dport 445 -j DROP
```

---

## Validation After Fix

- The blocking rule was no longer present in `iptables`
- The share opened successfully again from Windows
- Write access was restored by creating `incident04-restart.txt` in `\\192.168.56.101\companydocs\Shared`

---

## Related Evidence

- `screenshots/incidents/incident_04/01-baseline-smbd-active.png`
- `screenshots/incidents/incident_04/02-baseline-port-445-listening.png`
- `screenshots/incidents/incident_04/03-baseline-share-opens.png`
- `screenshots/incidents/incident_04/04-baseline-ping-ok.png`
- `screenshots/incidents/incident_04/05-firewall-rule-added.png`
- `screenshots/incidents/incident_04/06-share-access-fails.png`
- `screenshots/incidents/incident_04/07-smbd-still-active-during-incident.png`
- `screenshots/incidents/incident_04/08-firewall-rule-removed.png`
- `screenshots/incidents/incident_04/09-share-restored.png`
- `screenshots/incidents/incident_04/10-write-test-restored.png`
