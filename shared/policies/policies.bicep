param apimInstanceName string

resource policy 'Microsoft.ApiManagement/service/policies@2021-08-01' = {
  name: '${apimInstanceName}/policy'
  properties: {
    format: 'rawxml'
    value: loadTextContent('./globalServicePolicy.xml')
  }
}
