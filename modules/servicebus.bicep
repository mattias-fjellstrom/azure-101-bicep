param location string

resource namespace 'Microsoft.ServiceBus/namespaces@2021-01-01-preview' = {
  name: 'sb-${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }

  resource auth 'AuthorizationRules' = {
    name: 'funcApp'
    properties: {
      rights: [
        'Listen'
        'Manage'
        'Send'
      ]
    }
  }

  resource queue 'queues' = {
    name: 'thumbnailqueue'
  }
}

#disable-next-line outputs-should-not-contain-secrets
output connectionString string = namespace::auth.listKeys().primaryConnectionString
