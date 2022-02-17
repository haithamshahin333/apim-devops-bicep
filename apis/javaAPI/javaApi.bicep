param apimServiceName string

resource javaApi 'Microsoft.ApiManagement/service/apis@2021-08-01' = {
  name: '${apimServiceName}/javaApi'
  properties: {
    path: 'javaApi'
    apiRevision: '1'
    apiRevisionDescription: 'initial api'
    displayName: 'java api'
    subscriptionRequired: false
    protocols: [
      'https' 
    ]
    format: 'openapi+json'
    value: loadTextContent('openapi.json')
  }
}
