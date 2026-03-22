# Network Diagram

## Topology

```
[Internet]
     |
  [Router]
  192.168.1.1
     |
  [Switch]
     |
  +---------+-----------+----------+
  |                     |          |
[ubuntu-server]  [win-ws-01]  [win-ws-02]
192.168.1.10     192.168.1.20  192.168.1.21
```

## Devices

| Device             | IP Address    | Role             |
|--------------------|---------------|------------------|
| Router             | 192.168.1.1   | Gateway / DHCP   |
| ubuntu-server      | 192.168.1.10  | File/Backup Server |
| win-workstation-01 | 192.168.1.20  | Workstation      |
| win-workstation-02 | 192.168.1.21  | Workstation      |
