# IP Addressing Plan

## Network: 192.168.1.0/24

| IP Address    | Hostname           | Device Type    | Role             |
|---------------|--------------------|----------------|------------------|
| 192.168.1.1   | router             | Router         | Gateway / DHCP   |
| 192.168.1.10  | ubuntu-server      | Virtual Machine | File/Backup Server |
| 192.168.1.20  | win-workstation-01 | Virtual Machine | Workstation      |
| 192.168.1.21  | win-workstation-02 | Virtual Machine | Workstation      |
| 192.168.1.100–200 | (dynamic)      | DHCP Pool      | Dynamic clients  |

## DNS

- Primary DNS: 8.8.8.8 (Google)
- Secondary DNS: 8.8.4.4 (Google)

## Subnet Details

| Parameter   | Value           |
|-------------|-----------------|
| Network     | 192.168.1.0     |
| Subnet Mask | 255.255.255.0   |
| Gateway     | 192.168.1.1     |
| Broadcast   | 192.168.1.255   |
