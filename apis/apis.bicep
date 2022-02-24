
param apimInstance object
param apimEnv string

module javaApi 'javaAPI/javaApi.bicep' = {
  name: 'javaApi'
  params: {
    apimServiceName: apimInstance.name
    apimEnv: apimEnv
  }
}

// module brandNewApi 'brandNewAPI/brandNewApi.bicep' = {
//   name: 'brandNewApi'
//   params: {
//     apimServiceName: apimInstance.name
//     apimEnv: apimEnv
//   }
// }
