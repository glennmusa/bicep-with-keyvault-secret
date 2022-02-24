param location string = resourceGroup().location

resource keyvault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: 'mykv${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    accessPolicies: []
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: subscription().tenantId
  }
}

var secretName = 'mySecret'
var myValue = 'abc123'

resource mySecret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  name: '${keyvault.name}/${secretName}'
  properties: {
    value: myValue
  }
}

module echoSecret './echoSecret.bicep' = {
  name: 'echoSecret'
  params: {
    location: location
    secret: keyvault.getSecret(secretName)
  }
}
