param apimServiceName string
param apimEnv string

var envConfigMap = {
  dev: {
    url: 'https://java-web-api-apimdemo-dev.azurewebsites.net'
  }
  staging: {
    url: 'https://java-web-api-apimdemo-staging.azurewebsites.net'
  }
  prod: {
    url: 'https://java-web-api-apimdemo.azurewebsites.net'
  }
}

resource demoFridayApi 'Microsoft.ApiManagement/service/apis@2020-06-01-preview' = {
  name: '${apimServiceName}/demoFridayApi'
  properties: {
    displayName: 'demoFridayApi'
    description: 'Api'
    serviceUrl: envConfigMap[apimEnv].url
    path: 'demofridayapi'
    subscriptionRequired: false
    protocols: [
      'https'
    ]
    format: 'openapi+json'
    value: loadTextContent('openapi.json')
  }
}
