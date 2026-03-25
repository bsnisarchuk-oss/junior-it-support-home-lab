# Network Troubleshooting Guide

Use this guide when the current lab stops behaving as expected.

---

## Layered Checklist

### Layer 1 - Physical / Virtual Link

- confirm both VMs are powered on
- confirm VirtualBox shows **Adapter 1 = NAT** and **Adapter 2 = Host-only**
- confirm the adapters are connected in the guest OS

### Layer 2 - Adapter State

- review adapter details with `ipconfig /all` on Windows
- review adapter details with `ip addr show` on Ubuntu
- look for disconnected or disabled adapters

### Layer 3 - IP Connectivity

- verify `office-srv-01` is reachable at `192.168.56.101`
- verify `office-pc-01` is reachable at `192.168.56.102`
- test local reachability before testing internet access

### Layer 4 - Ports

- check TCP 445 for Samba
- check TCP 22 for SSH

### Layer 7 - Services

- confirm `smbd` is running on the server
- confirm SSH is running on the server
- confirm the Windows client is using the correct share path

---

## Quick Diagnostic Commands

### Windows

```powershell
ipconfig /all
route print
Test-NetConnection -ComputerName 192.168.56.101 -Port 445
Test-NetConnection -ComputerName 192.168.56.101 -Port 22
```

### Ubuntu

```bash
ip addr show
ip route show
ss -tlnp
sudo systemctl status ssh
sudo systemctl status smbd
```

---

## Common Scenarios

| Problem | First Check | Common Fix |
|---------|-------------|------------|
| No internet | Test `ping 8.8.8.8` from the affected VM | Check the NAT adapter |
| Cannot reach server | Ping `192.168.56.101` | Check host-only adapter and VM state |
| Cannot reach workstation from server | Ping `192.168.56.102` | Check host-only adapter and Windows firewall if needed |
| Shared folder inaccessible | Test port 445 to `192.168.56.101` | Restart Samba or review firewall/config |
| SSH unavailable | Test port 22 to `192.168.56.101` | Check SSH service status |
