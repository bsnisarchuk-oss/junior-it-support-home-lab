# Remote Access

**Current state:** SSH access to `office-srv-01` is already working.

---

## SSH Access

### From Windows Terminal or PowerShell

```powershell
ssh <your-ubuntu-user>@192.168.56.101
```

### From PuTTY

- Host: `192.168.56.101`
- Port: `22`
- Connection type: `SSH`
- Username: use the Ubuntu account that exists on the live VM

---

## Optional Future Hardening

The items below are good next steps, but they are **not** documented as complete in the current lab:

```bash
# Generate a key pair on the client
ssh-keygen -t ed25519 -C "lab-admin"
```

After key setup, you can review SSH hardening such as disabling password authentication.

---

## Simple File Transfer

Use the home directory if you just need to copy a file to the server without assuming the Samba share path:

```powershell
scp file.txt <your-ubuntu-user>@192.168.56.101:~/
```

Or start an SFTP session:

```powershell
sftp <your-ubuntu-user>@192.168.56.101
```
