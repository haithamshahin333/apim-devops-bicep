param apimInstance object

module javaApi 'javaAPI/javaApi.bicep' = {
  name: 'javaApi'
  params: {
    apimServiceName: apimInstance.name
  }
}
