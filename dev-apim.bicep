param apimName string
param apimLocation string
param publisherName string
param publisherEmail string

resource bicepapim 'Microsoft.ApiManagement/service@2019-12-01' = {
  name: apimName
  location: apimLocation
  sku: {
    name: 'Developer'
    capacity: 1
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
    notificationSenderEmail: 'jaythebiggest@gmail.com'
    hostnameConfigurations: [
       {
       type: 'Proxy'
       hostName: 'bicepjay-apim-dev.azure-api.net'
       negotiateClientCertificate: false
       defaultSslBinding: false
       }
       ]
      customProperties: {
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TripleDes168': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Ssl30': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30': 'false'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'false'
      }
      virtualNetworkType: 'None'
      disableGateway: false
      apiVersionConstraint: {
      }
      }
      
  }
