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
    // the web endpoint of your web storage account e.g. https://mystorageaccount.z16.web.core.windows.net/
    websiteUrl: ''

    // provide app settings that your function app requires
    appSettings: [
      // {
      //   name: 'MY_APP_SETTING_1'
      //   value: 'value'
      // }
      // {
      //   name: 'MY_APP_SETTING_2'
      //   value: 'value'
      // }
    ]
  }
}
