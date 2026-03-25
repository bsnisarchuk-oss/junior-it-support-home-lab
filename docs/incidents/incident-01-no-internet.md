# Incident 01 - No Internet Access on Workstation

**Type:** planned lab simulation for future troubleshooting practice  
**Status:** not yet reproduced in the live lab

---

## Incident Details

| Field | Value |
|-------|-------|
| Incident ID | `INC-001` |
| Reported by | user on `office-pc-01` |
| Affected device | `office-pc-01` (`192.168.56.102`) |
| Priority | Medium |
| Current repo state | Scenario prepared, evidence not captured yet |

---

## Description

The workstation loses internet access even though the lab server may still be reachable on the host-only network.

This incident fits the current lab design because:

- `office-pc-01` uses a NAT adapter for internet access
- `office-pc-01` uses a host-only adapter to reach `office-srv-01`

That means the workstation can lose internet access while still being able to talk to the lab server.

---

## Planned Reproduction

Choose one method when you are ready to perform the simulation:

### Method A - Disable the NAT-side adapter

- disable the adapter that currently provides internet access on `office-pc-01`
- leave the host-only adapter enabled so the workstation can still reach `192.168.56.101`

### Method B - Break DNS on the internet-side adapter

- change the DNS settings on the internet-facing adapter to an invalid value
- keep the host-only adapter untouched

---

## Investigation Steps

Run these on `office-pc-01`:

```powershell
ipconfig /all
route print
ping 192.168.56.101
ping 8.8.8.8
nslookup google.com
```

Interpretation:

- if `192.168.56.101` works but `8.8.8.8` fails, focus on the NAT-side adapter or default route
- if `8.8.8.8` works but `google.com` fails, focus on DNS
- if neither the server nor the internet responds, check both adapters and the VM state

---

## Expected Root Cause

Record the real finding after the live test.

Possible expected outcomes:

- the NAT-side adapter was disabled or disconnected
- the internet-side adapter had invalid DNS settings

---

## Expected Resolution

When you run this incident for real, resolve it by restoring the broken internet-side setting:

- re-enable the NAT-side adapter, or
- restore working DNS settings on the internet-side adapter

After the fix, verify:

```cmd
ping 8.8.8.8
ping google.com
ping 192.168.56.101
```

---

## Screenshots to Capture Later

- [ ] `screenshots/incidents/inc-001-ipconfig-broken.png`
- [ ] `screenshots/incidents/inc-001-internet-failed.png`
- [ ] `screenshots/incidents/inc-001-resolved.png`

---

## Prevention

- avoid changing adapter settings without recording what changed
- keep the adapter roles clear: NAT for internet, Host-only for internal lab traffic
- document working network settings before reproducing the incident
