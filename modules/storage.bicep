param location string

resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'stphotos${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }

  resource blobService 'blobServices' = {
    name: 'default'

    resource imageContainer 'containers' = {
      name: 'images'
      properties: {
        publicAccess: 'Blob'
      }
    }

    resource thumbnailContainer 'containers' = {
      name: 'thumbnails'
      properties: {
        publicAccess: 'Blob'
      }
    }
  }
}

var endpointSuffix = environment().suffixes.storage
output storageAccountName string = storage.name

#disable-next-line outputs-should-not-contain-secrets
output connectionString string = 'DefaultEndpointsProtocol=https;AccountName=${storage.name};AccountKey=${storage.listKeys().keys[0].value};EndpointSuffix=${endpointSuffix}'
