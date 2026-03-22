# Connectivity Tests

## Basic Ping Tests

```bash
# Test gateway
ping 192.168.1.1

# Test server from workstation
ping 192.168.1.10

# Test internet
ping 8.8.8.8
ping google.com
```

## Windows Tests

```powershell
# Test-NetConnection (PowerShell)
Test-NetConnection -ComputerName 192.168.1.10 -Port 445
Test-NetConnection -ComputerName 192.168.1.10 -Port 22

# Traceroute
tracert 8.8.8.8

# View IP config
ipconfig /all
```

## Linux Tests

```bash
# Traceroute
traceroute 8.8.8.8

# Port check
nc -zv 192.168.1.10 22

# View IP config
ip addr show
ip route show
```

## Expected Results

| Test                        | Expected Result |
|-----------------------------|-----------------|
| Ping gateway                | <5ms response   |
| Ping server from workstation | <5ms response  |
| Ping 8.8.8.8                | Success         |
| Ping google.com             | Success (DNS OK)|
| SMB port 445 to server      | Open            |
| SSH port 22 to server       | Open            |
