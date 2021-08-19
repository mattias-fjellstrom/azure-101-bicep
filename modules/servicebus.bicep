// module specification:
//
// parameters:
//   - no parameters
//
// resources:
//   - Microsoft.ServiceBus/namespaces
//   - Microsoft.ServiceBus/namespaces/AuthorizationRules (with 'Manage', 'Listen', 'Send' rights)
//   - Microsoft.ServiceBus/namespaces/queues
//
// outputs:
//   - Connection string for the ServiceBus namespace
//     (hint: listKeys() https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-functions-resource#listkeys)
