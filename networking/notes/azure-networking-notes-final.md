# AZ-104 Azure Networking Notes

## Objective

Consolidate core Azure networking concepts for AZ-104 study and prepare for the VNet peering lab.

---

## 1. Virtual Network Basics

### Virtual Network (VNet)

A **Virtual Network** is a private network boundary in Azure. It allows Azure resources such as virtual machines, network interfaces, private endpoints, and some platform services to communicate privately.

**Simple analogy:**

```text
VNet = building
Subnet = rooms inside the building
```

### Subnet

A **subnet** is a smaller network segment inside a VNet. Subnets help separate workloads and apply security controls.

Common subnet examples:

```text
web-subnet
app-subnet
database-subnet
management-subnet
```

Important exam rules:

```text
A subnet must be inside the VNet address space.
Subnets inside the same VNet cannot overlap.
If one subnet uses the whole VNet range, no other subnet can be added.
```

Example VNet design:

```text
VNet address space: 10.0.0.0/16

default:     10.0.0.0/24
midrange:    10.0.1.0/24
web-subnet:  10.0.2.0/24
app-subnet:  10.0.3.0/24
```

Some Azure services require dedicated subnets, such as:

- Azure Bastion
- VPN Gateway
- Application Gateway
- Azure Firewall

---

## 2. VM Network Path

Azure VMs connect to networks through a **Network Interface Card (NIC)**.

For a VM with public access, the traffic path is:

```text
Internet → Public IP → NIC → VM
```

Important relationship:

```text
VM → NIC → IP configuration → Public IP
```

A public IP is usually associated with the NIC IP configuration, not directly with the VM.

---

## 3. Public IP vs Private IP

| IP Type | Purpose |
|---|---|
| **Public IP** | Allows internet-facing access to a resource |
| **Private IP** | Allows communication inside a VNet or private network |

Cost-control note:

```text
Delete unused Public IPs after labs.
```

---

## 4. Network Security Groups (NSGs)

An **NSG** controls inbound and outbound traffic. It works like a firewall rule set for Azure networking.

NSGs can be associated with:

- Subnets
- Network interfaces

Common ports:

| Access Type | Port |
|---|---:|
| RDP for Windows | TCP 3389 |
| SSH for Linux | TCP 22 |

Security reminder:

```text
Do not leave RDP open to the internet after labs.
In production, restrict source IP or use Azure Bastion, VPN, or JIT access.
```

### NSG Rule Priority

NSG rules are processed by priority number.

```text
Lower number = processed first
```

Example:

```text
Priority 100 rule is evaluated before Priority 300 rule.
```

### Effective Security Rules

**Effective security rules** show the final rules applied to a NIC. This is useful when troubleshooting blocked traffic.

---

## 5. Application Security Groups (ASGs)

An **Application Security Group** allows you to group VMs logically for NSG rules.

Instead of writing rules against IP addresses, you can write rules based on application roles.

Example:

```text
web-servers → app-servers → database-servers
```

ASGs help simplify security rules in larger environments.

---

## 6. VNet Peering

**VNet peering** connects two Azure virtual networks so resources can communicate privately.

Key points:

- Peering uses private IP communication.
- Traffic stays on the Microsoft backbone network.
- Address spaces cannot overlap.
- Peering is not transitive by default.

Example:

```text
VNet A ↔ VNet B
```

### Non-Transitive Peering

This is important for AZ-104.

If:

```text
VNet A peers with VNet B
VNet B peers with VNet C
```

That does **not** automatically mean:

```text
VNet A can talk to VNet C
```

To allow communication between A and C, you need additional peering or another routing design.

---

## 7. Regional vs Global VNet Peering

| Peering Type | Meaning |
|---|---|
| **Regional VNet Peering** | VNets are in the same Azure region |
| **Global VNet Peering** | VNets are in different Azure regions |

Example:

```text
East US VNet ↔ Central US VNet
```

Global peering is commonly used for:

- Disaster recovery
- Multi-region applications
- Global private connectivity

Cost note:

```text
Global peering can cost more because traffic may move across regions.
Only send essential data across peered networks.
```

---

## 8. Virtual Network Gateway

A **Virtual Network Gateway** is used for VPN and ExpressRoute connectivity.

Think:

```text
VNet Gateway = VPN device in Azure
```

Used for:

- Site-to-site VPN
- Point-to-site VPN
- VNet-to-VNet VPN
- ExpressRoute gateway

Cost warning:

```text
Virtual Network Gateways can generate charges while deployed.
Do not leave gateway resources running after labs unless needed.
```

---

## 9. Site-to-Site VPN

A **site-to-site VPN** connects an on-premises network to Azure through an encrypted tunnel.

Example:

```text
On-premises network ↔ VPN Gateway ↔ Azure VNet
```

Use this when the requirement is encrypted connectivity between Azure and an on-premises network.

---

## 10. VNet Peering vs VPN Gateway vs ExpressRoute

| Feature | VNet Peering | VPN Gateway | ExpressRoute |
|---|---|---|---|
| Connects Azure VNets | Yes | Yes, with VNet-to-VNet VPN | Yes, depending on design |
| Connects Azure to on-premises | No | Yes | Yes |
| Uses private IP communication | Yes | Yes | Yes |
| Uses encrypted VPN tunnel | No | Yes | No, private dedicated circuit |
| Complexity | Lower | Higher | Higher |
| Typical cost | Usually lower | Higher than basic peering | Higher |
| Best use | Azure VNet-to-VNet private connectivity | VPN-based hybrid connectivity | Private dedicated hybrid connectivity |

Exam memory rule:

```text
VNet Peering = connect Azure VNets privately
VPN Gateway = connect Azure to on-premises or VPN-based networks
ExpressRoute = private dedicated circuit
```

---

## 11. BGP in Azure Hybrid Networking

**BGP**, or Border Gateway Protocol, is used for dynamic route sharing between networks.

BGP is important when connecting:

```text
On-prem Data Center ↔ Azure
Branch Offices ↔ Azure
Co-location Data Center ↔ Cloud
Multiple VNets ↔ On-prem
```

With BGP enabled, networks can automatically advertise routes to each other.

Simple mental picture:

```text
BGP is like GPS for networks.
Instead of manually telling traffic every road to take,
BGP lets networks share road maps with each other.
```

For AZ-104, recognize BGP in questions involving:

- VPN Gateway
- ExpressRoute
- On-prem connectivity
- Route propagation
- Hybrid networking
- Failover paths

---

## 12. Azure DNS and Private DNS

### Azure DNS

Azure DNS hosts public DNS zones for internet-facing domain records.

Common public DNS record types:

- A
- CNAME
- MX
- TXT

### Private DNS Zone

A **Private DNS Zone** provides internal name resolution inside Azure VNets.

Key points:

- Used for private/internal Azure name resolution
- Can be linked to one or more VNets
- Commonly used with private endpoints

Exam rule:

```text
Private DNS Zones must be linked to VNets.
```

### App Service Custom Domain

When mapping a custom domain to Azure App Service, DNS records must be configured correctly before validation.

Common records:

- CNAME
- TXT validation record

---

## 13. High-Value AZ-104 Exam Notes

Networking questions often test relationships:

```text
VNet → Subnet → NIC → VM
NSG → Subnet or NIC
Public IP → NIC IP configuration
Private DNS Zone → VNet link
Peering → VNet to VNet
Gateway → VPN / ExpressRoute
```

Core rules:

- VNets provide private network isolation.
- Subnets divide VNet address space.
- A VM must connect to a subnet inside a VNet.
- Public IPs are associated through NIC IP configurations.
- NSG rules are processed by priority.
- Lower NSG priority numbers are processed first.
- VNet peering requires non-overlapping address spaces.
- VNet peering is not transitive by default.
- Public DNS is for internet-facing name resolution.
- Private DNS is for internal Azure name resolution.
- Virtual Network Gateways can generate cost while deployed.

---

## 14. PowerShell / Azure CLI Review Commands

### Azure CLI

Check current subscription:

```bash
az account show -o table
```

List resource groups:

```bash
az group list -o table
```

List VNets:

```bash
az network vnet list -o table
```

List subnets in a VNet:

```bash
az network vnet subnet list \
  --resource-group <resource-group-name> \
  --vnet-name <vnet-name> \
  -o table
```

List public IPs:

```bash
az network public-ip list -o table
```

List NSGs:

```bash
az network nsg list -o table
```

List VNet peerings:

```bash
az network vnet peering list \
  --resource-group <resource-group-name> \
  --vnet-name <vnet-name> \
  -o table
```

### Azure PowerShell

Check current context:

```powershell
Get-AzContext
```

List resource groups:

```powershell
Get-AzResourceGroup
```

List VNets:

```powershell
Get-AzVirtualNetwork
```

List subnets for a VNet:

```powershell
$vnet = Get-AzVirtualNetwork -ResourceGroupName "<resource-group-name>" -Name "<vnet-name>"
$vnet.Subnets
```

List NSGs:

```powershell
Get-AzNetworkSecurityGroup
```

---

## 15. Screenshot Checklist

Capture screenshots for GitHub documentation:

- Resource group
- VNet overview
- VNet address space
- Subnet page
- Public IP page
- NIC IP configuration
- NSG inbound rule for RDP or SSH
- VNet peering page
- Private DNS Zone
- Public DNS Zone
- Effective security rules
- Application Security Group
- Cleanup/deleted resource group confirmation

---

## 16. Interview Explanation

I worked through Azure virtual networking concepts including VNets, subnets, public IPs, NIC configurations, NSG rules, VNet peering, Azure DNS, Private DNS Zones, and hybrid connectivity concepts such as VPN Gateway, ExpressRoute, and BGP. This helped reinforce how Azure resources are connected, secured, routed, and accessed within a cloud network.

---

## 17. Lessons Learned

Azure networking is foundational for AZ-104. Many topics connect back to the relationship between VNets, subnets, NICs, NSGs, public IPs, DNS, peering, and gateways.

VNet peering is best for private Azure-to-Azure connectivity, while VPN Gateway and ExpressRoute are used for hybrid connectivity with on-premises environments.

Networking labs should be documented carefully because the exam often tests how these resources relate to each other.
