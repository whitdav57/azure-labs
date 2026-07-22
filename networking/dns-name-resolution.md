# AZ-104 DNS and Name Resolution Notes

## Public DNS Zone

A public DNS zone hosts internet-facing DNS records for a public domain.

Common records:

| Record | Purpose |
|---|---|
| A | Maps a hostname to an IPv4 address |
| AAAA | Maps a hostname to an IPv6 address |
| CNAME | Maps a hostname to another DNS name |
| TXT | Used for verification and text-based records |
| MX | Mail exchange records |

## Private DNS Zone

A private DNS zone provides internal name resolution for Azure virtual networks.

Key rules:

```text
Private DNS zones are for internal/private name resolution.
Private DNS zones must be linked to VNets.
Private DNS is commonly used with private endpoints.
Linked VNets can resolve names from the private zone.
```

## App Service Custom Domain

App Service custom domains require DNS validation before the hostname can be added.

Common validation records:

```text
CNAME record
TXT verification record
A record for apex/root domain scenarios
```

## Exam Takeaways

```text
Public DNS = internet-facing name resolution.
Private DNS = internal Azure/VNet name resolution.
Azure-provided DNS works automatically inside VNets.
Custom DNS servers can be configured at the VNet level.
Private DNS zones must be linked to VNets.
DNS records are often required before App Service custom domain validation succeeds.
```
