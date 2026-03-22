# Samba Shared Folder Setup

## Install Samba

```bash
sudo apt install samba -y
```

## Create Shared Directory

```bash
sudo mkdir -p /srv/shared
sudo chown -R nobody:nogroup /srv/shared
sudo chmod 0775 /srv/shared
```

## Configure Samba

```bash
sudo nano /etc/samba/smb.conf
```

Add at the end:

```ini
[Shared]
   path = /srv/shared
   browseable = yes
   read only = no
   guest ok = yes
   create mask = 0664
   directory mask = 0775
```

## Restart Samba

```bash
sudo systemctl restart smbd
sudo systemctl enable smbd
```

## Access from Windows

In File Explorer address bar:
```
\\192.168.1.10\Shared
```

Or map as network drive: `Z:`

## Troubleshooting

- Check firewall: `sudo ufw allow samba`
- Check status: `sudo systemctl status smbd`
- See: `scripts/linux/setup-samba.sh` for automated setup
