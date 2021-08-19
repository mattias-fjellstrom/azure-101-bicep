module web './modules/web.bicep' = {
  name: 'web-module-deployment'
}

module storage './modules/storage.bicep' = {
  name: 'storage-module-deployment'
}

module cosmos './modules/cosmos.bicep' = {
  name: 'cosmos-module-deployment'
}

module servicebus './modules/servicebus.bicep' = {
  name: 'servicebus-module-deployment'
}

// function app module
module functionApp './modules/function-app.bicep' = {
  name: 'function-app-module-deployment'
  params: {
    // provide the web endpoint for your storage account
    // e.g. https://mystorageaccount.z16.web.core.windows.net/
    websiteUrl: 'https://...'

    // provide any app settings that you require
    appSettings: [
      // {
      //   name: 'STORAGEACCOUNT_NAME'
      //   value: <reference to storage account name>
      // }
      // {
      //   name: 'STORAGEACCOUNT_CONNECTIONSTRING'
      //   value: <reference to storage account connection string>
      // }
    ]
  }
}
