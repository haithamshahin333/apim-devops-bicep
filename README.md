# APIM DevOps Workflow

## Deployment

```bash
# COPY PARAMETERS TO LOCAL FILE
# FILL IN UNSPECIFIED PARAMS
cp main.parameters.json local.parameters.json

# SPECIFY LOCATION FOR DEPLOYMENT (USED FOR METADATA, NOT LOCATION FOR APIM DEPLOYMENT)
EXPORT LOCATION=eastus

# DEPLOY
az deployment sub create \
    --location $LOCATION \
    --template-file main.bicep \
    --parameters local.parameters.json \
    --confirm-with-what-if #if you want to see changes before confirming deployment
```

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

## 