// module specification:
//
// parameters:
//   - database name
//   - container name
//
// resources:
//   - Microsoft.DocumentDB/databaseAccounts (provided)
//   - Microsoft.DocumentDB/databaseAccounts/sqlDatabases
//   - Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers
//
// outputs:
//   - Connection string for the Cosmos DB account
//     (hint: listConnectionStrings())


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
