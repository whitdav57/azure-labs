# Azure Networking Lab Commands

## Login and Subscription Check

```powershell
az login --use-device-code
az account show -o table
az account set --subscription "<subscription-name-or-id>"
```

## Resource Review

```powershell
az group list -o table
az resource list --output table
az vm list -o table
az network vnet list -o table
az network public-ip list -o table
az network nsg list -o table
```

## Review a Specific Resource Group

```powershell
az resource list --resource-group <resource-group-name> --output table
```

## Cleanup

```powershell
az group delete --name <resource-group-name> --yes --no-wait
az group exists --name <resource-group-name>
```

Expected cleanup result:

```text
false
```
