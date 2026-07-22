# AZ-104 Networking Lab

## Objective

This folder documents AZ-104 networking practice covering virtual networks, subnets, DNS concepts, NSG rules, exported ARM templates, and cost cleanup.

## Skills Practiced

- Created and reviewed Azure Virtual Networks
- Created and modified subnets
- Reviewed public and private IP behavior
- Reviewed NSG inbound/outbound rules
- Reviewed RDP port 3389 access behavior
- Practiced Azure DNS and Private DNS concepts
- Exported an ARM template for a manufacturing VNet scenario
- Captured screenshots for lab evidence
- Cleaned up Azure resources after the lab

## Recommended Folder Layout

```text
networking/
  README.md
  vnet-peering-and-routing-lab.md
  dns-name-resolution.md
  commands.md
  arm-templates/
    manufacturing-vnet/
      template.json
      parameters.json
  screenshots/
```

## Lab Resource Notes

- Use a dedicated resource group for hands-on networking labs.
- Delete the entire lab resource group after screenshots and documentation are complete.
- Do not leave VMs, public IPs, gateways, firewalls, NAT Gateways, or Bastion resources running after lab work.

## Exam Rules

```text
A VNet is a private network boundary in Azure.
A subnet must be inside the VNet address space.
Subnets cannot overlap.
A VM connects to a VNet through a NIC.
Public IP access is associated through the NIC IP configuration.
NSGs control inbound and outbound traffic.
Lower NSG priority numbers are processed first.
RDP uses TCP 3389.
SSH uses TCP 22.
Different VNets do not communicate by default.
VNet peering enables private IP communication between VNets.
VNet peering address spaces cannot overlap.
VNet peering is not transitive by default.
Private DNS zones must be linked to VNets.
User-defined routes can override or add to system routes.
Route tables are associated with subnets.
Network Watcher helps troubleshoot connectivity.
```

## Screenshots Included

| File | Purpose |
|---|---|
| `01-deployment-created-task2.png` | Deployment evidence |
| `02-core-vnet-overview.png` | Core VNet overview |
| `03-vnet-created.png` | VNet created evidence |
| `04-subnets-created.png` | Subnet list |
| `05-subnet-added-core.png` | Core subnet added |
| `06-subnet-added-manufacturing.png` | Manufacturing subnet added |
| `07-vnet-lab-connection-diagram.png` | Lab architecture / connection reference |
| `08-nsg-inbound-outbound-rules.png` | NSG rules review |
| `09-rdp-3389-rule-open.png` | RDP rule evidence |
| `10-ip-address-review.png` | IP address review |
| `11-template-deployment.png` | ARM template deployment/export reference |
| `12-private-dns-config.png` | Private DNS configuration |
| `13-public-dns-config.png` | Public DNS configuration |
| `14-resource-delete-confirmation.png` | Cleanup evidence |

## Cleanup Command

```powershell
az group delete --name <resource-group-name> --yes --no-wait
az group exists --name <resource-group-name>
```

Expected final result:

```text
false
```
