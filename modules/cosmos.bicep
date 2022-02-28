param databaseName string
param containerName string
param location string

resource account 'Microsoft.DocumentDB/databaseAccounts@2021-06-15' = {
  name: 'cosmos-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
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

  resource database 'sqlDatabases' = {
    name: databaseName
    properties: {
      resource: {
        id: databaseName
      }
    }

    resource container 'containers' = {
      name: containerName
      properties: {
        resource: {
          id: containerName
          partitionKey: {
            kind: 'Hash'
            paths: [
              '/id'
            ]
          }
        }
      }
    }
  }
}

#disable-next-line outputs-should-not-contain-secrets
output connectionString string = account.listConnectionStrings().connectionStrings[0].connectionString
