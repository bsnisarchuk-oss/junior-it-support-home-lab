# Incident 01 — No Internet Access on Workstation

> **Type:** Lab simulation — this incident is reproduced intentionally to practice troubleshooting.
> **⚙️ Status:** Scenario defined — must be reproduced and resolved manually in the lab.

---

## Incident Details

| Field | Value |
|-------|-------|
| Incident ID | INC-001 |
| Date reported | _(fill in during lab session)_ |
| Reported by | labuser (win-workstation-01) |
| Affected device | WIN-WS-01 (192.168.1.20) |
| Priority | Medium |
| Status | ⚙️ To be completed in lab |

---

## Description

User reports that web browsing stopped working. They cannot open any websites.
The computer appears to be on the network (the network icon in the taskbar shows connected).

---

## How to Reproduce This Incident in the Lab

> ⚙️ **Do this to intentionally break internet access:**

On WIN-WS-01 (run PowerShell as Administrator):
```powershell
# Remove the default gateway to simulate misconfigured network settings
$adapter = Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | Select-Object -First 1
Remove-NetRoute -InterfaceAlias $adapter.Name -DestinationPrefix "0.0.0.0/0" -Confirm:$false
```

Or manually: Settings → Network → Ethernet → Edit IP → remove the Gateway field and save.

---

## Investigation Steps

> Work through these steps in order. Stop when the root cause is found.

### Step 1 — Can the user reach a specific website?

```cmd
ping google.com
ping 8.8.8.8
```

Expected (broken state):
- `ping google.com` → "Ping request could not find host" (DNS failure) OR "Request timed out"
- `ping 8.8.8.8` → "Request timed out" or "Destination unreachable"

**Interpretation:**
- If `8.8.8.8` fails but the local network works → routing/gateway issue
- If `8.8.8.8` works but `google.com` fails → DNS issue

### Step 2 — Check IP configuration

```cmd
ipconfig /all
```

Look for:
- IP address: should be `192.168.1.20`
- Subnet mask: should be `255.255.255.0`
- Default gateway: should be `192.168.1.1`
- DNS: should be `8.8.8.8`

**Common findings:**
- Default gateway is empty or wrong → gateway misconfiguration
- IP is `169.254.x.x` (APIPA) → DHCP not working, no static IP set
- DNS is empty or wrong → DNS misconfiguration

### Step 3 — Test layer by layer

```cmd
REM Can we reach the local network?
ping 192.168.1.10

REM Can we reach the gateway?
ping 192.168.1.1

REM Can we reach the internet by IP?
ping 8.8.8.8

REM Can we resolve DNS?
nslookup google.com
```

---

## Root Cause

> ⚙️ Fill in after completing the lab investigation.

**Expected root cause for this simulation:** Default gateway was removed from the network adapter settings. Without a gateway, the workstation cannot route traffic to any network outside its own subnet (192.168.1.0/24), so all internet traffic fails.

_Actual finding during lab:_
```
[fill in]
```

---

## Resolution

> ⚙️ Fill in after completing the lab resolution.

**Expected resolution:** Restore the default gateway in the network adapter settings.

**Manual fix:**
1. Settings → Network & Internet → Ethernet → Edit
2. Set Gateway back to `192.168.1.1`
3. Save and test

**PowerShell fix (as Administrator):**
```powershell
$adapter = Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | Select-Object -First 1
New-NetRoute -InterfaceAlias $adapter.Name -DestinationPrefix "0.0.0.0/0" -NextHop "192.168.1.1"
```

After fix, verify:
```cmd
ping 8.8.8.8
ping google.com
```

_Actual steps taken during lab:_
```
[fill in]
```

---

## Screenshots to Take

- [ ] `screenshots/incidents/inc-001-ipconfig-broken.png` — ipconfig showing missing gateway
- [ ] `screenshots/incidents/inc-001-ping-failed.png` — ping 8.8.8.8 failing
- [ ] `screenshots/incidents/inc-001-resolved.png` — ping google.com successful after fix

---

## Prevention

For a real environment:
- Use DHCP with DHCP reservations so workstations always get the correct IP, gateway, and DNS automatically
- Avoid manual static IP configuration on end-user machines unless necessary
- Document any manually configured IPs in the inventory

---

## Time to Resolve

| Stage | Time |
|-------|------|
| Time reported → first investigation | _(fill in)_ |
| First investigation → root cause identified | _(fill in)_ |
| Root cause → resolved | _(fill in)_ |
| **Total** | _(fill in)_ |
