targetScope = 'subscription'

param location string = 'eastus'
param resourceGroupName string = 'apim'

param publisherEmail string
param publisherName string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module serviceConfig 'service/service.bicep' = {
  name: 'serviceConfiguration'
  scope: resourceGroup
  params: {
    publisherEmail: publisherEmail
    publisherName: publisherName
    location: location
  }
}

module shared 'shared/shared.bicep' = {
  name: 'shared'
  scope: resourceGroup
  params: {
    apimInstance: serviceConfig.outputs.apimInstance
  }
}

module apis 'apis/apis.bicep' = {
  name: 'apis'
  scope: resourceGroup
  params: {
    apimInstance: serviceConfig.outputs.apimInstance
  }
}
