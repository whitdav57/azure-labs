
Scaleout Appservice


az webapp update --resource-group whitnewapp  --name wdave --slot staging --minimum-elastic-instance-count 1



Remove Resources
wdave app


whitnewapp

PS

Remove-AzResourceGroup -Name whitnewapp 

Bash

az group delete --name resourceGroupName.


## AZ-104 Exam Notes

Deployment Slots

Purpose:
- Blue/Green deployment
- Zero downtime deployments
- Testing before production

Supported Plans
- Standard
- Premium
- Isolated

Not Supported
- Free
- Shared
- Basic

Slot Swap
Production <-> Staging

Benefits
- Zero downtime
- Easy rollback
- Validate changes first

Also keep your cleanup commands:

Remove-AzResourceGroup -Name whitnewapp
az group delete --name whitnewapp

and the scale-out command you captured:

az webapp update --resource-group whitnewapp --name wdave --slot staging --minimum-elastic-instance-count 1

