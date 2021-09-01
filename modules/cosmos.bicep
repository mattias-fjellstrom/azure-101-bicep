resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2021-06-15' = {
  name: 'cosmos-${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: resourceGroup().location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}

// TODO: add a resource of type Microsoft.DocumentDB/databaseAccounts/sqlDatabases

// TODO: add a resource of type Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers

// TODO: add an output for the connection string of the Cosmos DB account
//       hint: use listConnectionStrings() https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-functions-resource#list
