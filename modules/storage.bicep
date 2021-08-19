// module specification:
//
// parameters:
//   - no parameters
//
// resources:
//   - Microsoft.Storage/storageAccounts
//   - Microsoft.Storage/storageAccounts/blobServices/containers with name: 'images'
//   - Microsoft.Storage/storageAccounts/blobServices/containers with name: 'thumbnails'
//
// outputs:
//   - Connection string for the Storage account (sample provided below)
//     (hint: use string concatenation and the listKeys() function to construct the connection string)



output connectionString string = 'DefaultEndpointsProtocol=https;AccountName=<YOUR ACCOUNT NAME>;AccountKey=<YOUR ACCOUNT KEY>;EndpointSuffix=core.windows.net'
