# bicep-with-keyvault-secret
Deploy a KeyVault and a KeyVault secret using Bicep and use those resources in another resource.

## This does not work

As of this commit, deploying `main.bicep` from this repository will not start a deployment, but instead will return a `KeyVaultParameterReferenceNotFound` error:

```json
{
    "code": "KeyVaultParameterReferenceNotFound",
    "message": "The specified KeyVault '/subscriptions/{subscription}/resourceGroups/{resource group}/providers/Microsoft.KeyVault/vaults/{key vault}' could not be found. Please see https://aka.ms/arm-keyvault for usage details."
}
```

## How to try this

You could execute this deployment like so:

```plaintext
az login
az group create -l eastus -g echosecret
az deployment group create -g echosecret -n setsecret -f ./main.bicep
```

## Issue has been opened

As of this commit, this is an Issue at Azure/bicep [#4081](https://github.com/Azure/bicep/issues/4081).

