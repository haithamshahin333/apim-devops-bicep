# APIM DevOps Workflow

## Deployment via CLI/Terminal

```bash
# COPY PARAMETERS TO LOCAL FILE
# FILL IN UNSPECIFIED PARAMS
cp main.parameters.json local.parameters.json

# SPECIFY LOCATION FOR DEPLOYMENT (USED FOR METADATA, NOT LOCATION FOR APIM DEPLOYMENT)
export LOCATION=eastus

# DEPLOY
az deployment sub create \
    --location $LOCATION \
    --name apim-deployment-`date +"%Y-%m-%d-%s"` \
    --template-file main.bicep \
    --parameters local.parameters.json \
    --confirm-with-what-if #if you want to see changes before confirming deployment
```
## Deployment via GitHub Actions

1. Setup your Environments
    
    * Create the Dev Environment
    * 

1. Define the Service Principal

    ```bash
    # CREATE SERVICE PRINCIPAL FOR WORKFLOW
    # THIS WILL BE USED AS A GITHUB ACTIONS SECRET
    # BY DEFAULT WILL HAVE CONTRIBUTOR ON SUBSCRIPTION
    az ad sp create-for-rbac \
    --name BicepGitHubActionsSP \
    --role Contributor \
    --sdk-auth
    ```
2. Create a GitHub Secret named `AZURE_CREDENTIALS`

3. Run Workflow

## Initial Instantiation of APIM Instance

* [Service Configuration](https://docs.microsoft.com/en-us/azure/templates/microsoft.apimanagement/service?tabs=bicep)
    - SKU
    - [Capacity](https://docs.microsoft.com/en-us/azure/api-management/api-management-capacity)
    - Managed Identity
    - Certificates -> leverage Key Vault here
    - VNET Configuration

* [Shared Configuration](https://docs.microsoft.com/en-us/azure/templates/microsoft.apimanagement/service/products?tabs=bicep)
    - Products
    - Policies (Global/Product Level)
    - Loggers

* Portal Instantiation

## References

* [Bicep Linter](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/linter)