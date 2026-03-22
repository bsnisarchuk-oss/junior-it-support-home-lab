# Network Troubleshooting Guide

## OSI Model Approach (Bottom-Up)

### Layer 1 — Physical
- [ ] Check cable connections / VM network adapter is connected
- [ ] Check network adapter is enabled in Device Manager

### Layer 2 — Data Link
- [ ] Check MAC address / adapter details: `ipconfig /all`
- [ ] Check for link-local address (169.254.x.x = DHCP failed)

### Layer 3 — Network
- [ ] Check IP address is correct
- [ ] Check subnet mask and gateway
- [ ] Ping gateway: `ping 192.168.1.1`

### Layer 4 — Transport
- [ ] Check specific ports: `Test-NetConnection -Port 445`

### Layer 7 — Application
- [ ] Check service is running on server
- [ ] Check firewall rules

## Quick Diagnostic Commands

```powershell
# Windows — full network info
ipconfig /all
netstat -an
Get-NetAdapter
```

```bash
# Linux — full network info
ip addr show
ip route show
ss -tlnp
```

## Common Scenarios

| Problem              | First Check            | Common Fix                    |
|----------------------|------------------------|-------------------------------|
| No internet          | Ping gateway           | Fix default gateway / DHCP    |
| Can't reach server   | Ping server IP         | Check server is running / firewall |
| Shared folder inaccessible | Port 445 open?  | Restart Samba / check UFW     |
| DNS not working      | Ping 8.8.8.8 first     | Fix DNS settings              |
