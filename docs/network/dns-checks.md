# DNS Checks

## Windows

```cmd
# Basic lookup
nslookup google.com

# Specific DNS server
nslookup google.com 8.8.8.8

# Flush DNS cache
ipconfig /flushdns

# Display DNS cache
ipconfig /displaydns
```

## Linux

```bash
# Basic lookup
nslookup google.com
dig google.com

# Reverse lookup
dig -x 8.8.8.8

# Check /etc/resolv.conf
cat /etc/resolv.conf
```

## Common DNS Issues

| Symptom                     | Likely Cause          | Fix                        |
|-----------------------------|-----------------------|----------------------------|
| Can ping IP but not hostname | DNS not configured   | Set correct DNS server     |
| Slow resolution             | Wrong DNS server      | Change to 8.8.8.8          |
| No resolution at all        | DNS server unreachable | Check network connectivity |
| Stale cache                 | Old cached entry      | `ipconfig /flushdns`       |
