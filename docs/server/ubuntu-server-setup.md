# Ubuntu Server Setup

## Installation

1. Boot from Ubuntu Server 22.04 LTS ISO
2. Choose "Install Ubuntu Server"
3. Set hostname: `ubuntu-server`
4. Create admin user
5. Enable OpenSSH during installation

## Post-Install Configuration

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Set static IP (edit netplan config)
sudo nano /etc/netplan/00-installer-config.yaml
```

### Netplan Example

```yaml
network:
  version: 2
  ethernets:
    ens33:
      dhcp4: no
      addresses: [192.168.1.10/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

```bash
sudo netplan apply
```

## SSH Access

```bash
ssh admin@192.168.1.10
```

## Next Steps

- Configure Samba: see `samba-shared-folder-setup.md`
- Configure backups: see `backup-strategy.md`
- Configure remote access: see `remote-access.md`
