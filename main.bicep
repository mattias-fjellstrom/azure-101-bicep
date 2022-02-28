param location string = deployment().location
param deploymentNameSuffix string = utcNow('yyyy-MM-ddTHH-mm')
param resourceGroupName string = 'rg-${deployment().name}-${uniqueString(deployment().name)}'

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module web './modules/web.bicep' = {
  name: '${deploymentNameSuffix}-web'
  scope: rg
  params: {
    location: location
  }
}

module storage './modules/storage.bicep' = {
  name: '${deploymentNameSuffix}-storage'
  scope: rg
  params: {
    location: location
  }
}

module cosmos './modules/cosmos.bicep' = {
  name: '${deploymentNameSuffix}-cosmos'
  scope: rg
  params: {
    location: location
    databaseName: 'app'
    containerName: 'images'
  }
}

module servicebus './modules/servicebus.bicep' = {
  name: '${deploymentNameSuffix}-servicebus'
  scope: rg
  params: {
    location: location
  }
}

module functionApp './modules/function-app.bicep' = {
  name: '${deploymentNameSuffix}-functionApp'
  scope: rg
  params: {
    location: location
    corsUrls: [
      web.outputs.storageWebEndpoint
      web.outputs.cdnEndpoint
    ]
    appSettings: [
      {
        name: 'STORAGEACCOUNT_NAME'
        value: storage.outputs.storageAccountName
      }
      {
        name: 'STORAGEACCOUNT_CONNECTIONSTRING'
        value: storage.outputs.connectionString
      }
      {
        name: 'COSMOSDB_CONNECTIONSTRING'
        value: cosmos.outputs.connectionString
      }
      {
        name: 'SERVICEBUS_CONNECTIONSTRING'
        value: servicebus.outputs.connectionString
      }
    ]
  }
}
