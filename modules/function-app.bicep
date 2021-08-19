@description('The URL to the web site, required for CORS settings on the function app')
param websiteUrl string

@description('Application specific settings such as connection strings')
param appSettings array = []

var nameSuffix = '${uniqueString(resourceGroup().id)}'

var urlMinusTrailingSlash = take(websiteUrl, length(websiteUrl)-1)

resource plan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: 'plan-${nameSuffix}'
  location: resourceGroup().location
  kind: 'Linux'
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
    size: 'Y1'
    family: 'Y'
    capacity: 0
  }
}

resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'funcstorage${nameSuffix}'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'appinsights-${nameSuffix}'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource functionApp 'Microsoft.Web/sites@2021-01-15' = {
  name: 'funcapp-${nameSuffix}'
  location: resourceGroup().location
  kind: 'functionapp'
  properties: {
    siteConfig: {
      cors: {
        allowedOrigins: [
          'http://localhost:3000'
          urlMinusTrailingSlash
        ]
      }
      appSettings: concat(appSettings, [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsights.properties.InstrumentationKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsights.properties.ConnectionString
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${stg.name};AccountKey=${listKeys(stg.name, stg.apiVersion).keys[0].value};EndpointSuffix=core.windows.net'
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~3'
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'node'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: 'DefaultEndpointsProtocol=https;AccountName=${stg.name};AccountKey=${listKeys(stg.name, stg.apiVersion).keys[0].value};EndpointSuffix=core.windows.net'
        }
      ])
    }
    serverFarmId: plan.id
  }
}
