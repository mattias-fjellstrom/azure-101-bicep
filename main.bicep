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

module functionApp './modules/function-app.bicep' = {
  name: 'function-app-module-deployment'
  params: {
    // TODO: add a reference to the website endpoint for your web storage account
    // this output is available from the 'web' module
    websiteUrl: ''

    // TODO: add application settings that your function app requires
    // - go through the local.settings.json file in your function app project to see which app settings you need
    // - check ./modules/function-app.bicep to see which app settings are provided automatically for you
    appSettings: [
      // {
      //   name: 'EXAMPLE_SETTING_1'
      //   value: 'example-value-1'
      // }
      // {
      //   name: 'EXAMPLE_SETTING_2'
      //   value: 'example-value-2'
      // }
    ]
  }
}
