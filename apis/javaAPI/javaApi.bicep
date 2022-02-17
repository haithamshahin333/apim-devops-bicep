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
    format: 'openapi'
    value: '''
    {"openapi":"3.0.1","info":{"title":"OpenAPI definition","version":"v0"},"servers":[{"url":"https://UPDATE","description":"Generated server url"}],"paths":{"/greetingTest":{"get":{"tags":["greeting-controller"],"operationId":"greeting","parameters":[{"name":"name","in":"query","required":false,"schema":{"type":"string","default":"World"}}],"responses":{"200":{"description":"OK","content":{"*/*":{"schema":{"$ref":"#/components/schemas/Greeting"}}}}}}}},"components":{"schemas":{"Greeting":{"type":"object","properties":{"id":{"type":"integer","format":"int64"},"content":{"type":"string"}}}}}}
    '''
  }
}
