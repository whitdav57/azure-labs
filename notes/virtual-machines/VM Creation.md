## AZ-104 VM Deployment via PowerShell

### Create VM

New-AzVM `
-ResourceGroupName 'az104-rg8' `
-Name 'myazurevm3912' `
-Location 'East US' `
-Image 'Win2019Datacenter' `
-Zone '1' `
-Size 'Standard_D2s_v3' `
-Credential (Get-Credential)

### Verify NIC

Get-AzNetworkInterface -ResourceGroupName az104-rg8

### Verify Public IP

Get-AzPublicIpAddress -ResourceGroupName az104-rg8

### Lessons Learned

- Not all image aliases work in Cloud Shell.
- Verify images using:
  - Get-AzVMImageOffer
  - Get-AzVMImageSku
  - Get-AzVMImage
- Standard_D2s_v3 deployment successful.