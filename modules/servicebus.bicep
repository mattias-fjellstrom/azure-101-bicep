// TODO: add a resource of type Microsoft.ServiceBus/namespaces
//       - use the 'Basic' service tier

// TODO: add a resource of type Microsoft.ServiceBus/namespaces/AuthorizationRules
//       - specify 'Manage', 'Listen', 'Send' rights

// TODO: add a resource of type Microsoft.ServiceBus/namespaces/queues
//       - make sure to give the queue the name that your function app expects
//         (i.e. if you have hardcoded the name in your function app you need to set the same name for the queue here)

// TODO: add an output for the connection string for the AuthorizationRules resources (note, not the namespace resource!)
//       - hint: use listKeys() https://docs.microsoft.com/azure/azure-resource-manager/bicep/bicep-functions-resource#list
//               see a sample response from this function at https://docs.microsoft.com/rest/api/servicebus/stable/namespaces-authorization-rules/list-keys#examples
//               (scroll down to "Sample response")
