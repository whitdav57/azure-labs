resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name:'az104${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location

  sku: {
    name: 'Standard_LRS'
  }

  kind: 'StorageV2'
}
