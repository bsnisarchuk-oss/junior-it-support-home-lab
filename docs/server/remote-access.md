# Remote Access

## SSH Access

### From Linux/macOS
```bash
ssh admin@192.168.1.10
```

### From Windows
Use PuTTY or Windows Terminal:
```
Host: 192.168.1.10
Port: 22
```

## SSH Key Authentication (Recommended)

```bash
# Generate key pair on client
ssh-keygen -t ed25519 -C "lab-admin"

# Copy public key to server
ssh-copy-id admin@192.168.1.10
```

## Disable Password Auth (after key setup)

```bash
sudo nano /etc/ssh/sshd_config
# Set: PasswordAuthentication no
sudo systemctl restart ssh
```

## File Transfer

```bash
# SCP
scp file.txt admin@192.168.1.10:/srv/shared/

# SFTP (interactive)
sftp admin@192.168.1.10
```

## WinSCP (Windows GUI)

- Protocol: SFTP
- Host: 192.168.1.10
- Port: 22
- Username: admin
