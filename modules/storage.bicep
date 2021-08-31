// module specification:
//
// parameters:
//   - no parameters
//
// resources:
//   - Microsoft.Storage/storageAccounts
//   - Microsoft.Storage/storageAccounts/blobServices/containers with name: 'images'
//   - Microsoft.Storage/storageAccounts/blobServices/containers with name: 'thumbnails'
//     (hint: remember to enable public access for blobs in both containers)
//
// outputs:
//   - Connection string for the Storage account (sample provided below)
//     (hint: use string concatenation and the listKeys() function to construct the connection string)



output connectionString string = 'DefaultEndpointsProtocol=https;AccountName=<YOUR ACCOUNT NAME>;AccountKey=<YOUR ACCOUNT KEY>;EndpointSuffix=core.windows.net'
