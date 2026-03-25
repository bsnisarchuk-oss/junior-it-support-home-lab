# Connectivity Tests

Use these commands to validate the **current** lab.

---

## Windows Workstation to Server

Run these on `office-pc-01`:

```powershell
# Basic host-only reachability
ping 192.168.56.101

# Test SMB
Test-NetConnection -ComputerName 192.168.56.101 -Port 445

# Test SSH
Test-NetConnection -ComputerName 192.168.56.101 -Port 22

# Review addressing and routes
ipconfig /all
route print
```

---

## Ubuntu Server to Workstation

Run these on `office-srv-01`:

```bash
# Basic host-only reachability
ping -c 4 192.168.56.102

# Review addressing and routes
ip addr show
ip route show

# Check listening services
sudo systemctl status ssh
sudo systemctl status smbd
```

---

## Internet Validation Through NAT

Run these on whichever VM you are testing:

```bash
ping -c 4 8.8.8.8
ping -c 4 google.com
```

On Windows, use:

```cmd
ping 8.8.8.8
ping google.com
```

---

## Expected Results

| Test | Expected Result |
|------|-----------------|
| Ping from `office-pc-01` to `192.168.56.101` | Replies received |
| Port 445 to `office-srv-01` | Open |
| Port 22 to `office-srv-01` | Open |
| Ping from `office-srv-01` to `192.168.56.102` | Replies received |
| Ping `8.8.8.8` from a VM | Success while NAT is working |
| Ping `google.com` from a VM | Success while DNS is working |
