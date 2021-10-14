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
//       - make sure to give the database the name that your function app expects
//         (i.e. if you have hardcoded the name in your function app you need to set the same name for the database here)

// TODO: add a resource of type Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers
//       - make sure to give the container the name that your function app expects
//         (i.e. if you have hardcoded the name in your function app you need to set the same name for the container here)
//       - you will need to configure the "partitionKey" property (properties.resource.partitionKey)

// TODO: add an output for the connection string of the Cosmos DB account resource
//       - hint: use listConnectionStrings() https://docs.microsoft.com/azure/azure-resource-manager/bicep/bicep-functions-resource#list
//               see a sample response for this function at 
//               https://docs.microsoft.com/rest/api/cosmos-db-resource-provider/2021-04-15/database-accounts/list-connection-strings#examples
//               (scroll down to "Sample response")
