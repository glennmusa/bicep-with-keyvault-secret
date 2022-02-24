param location string = resourceGroup().location

@secure()
param secret string

resource echoScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'echoScript'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.25.0'
    cleanupPreference: 'OnSuccess'
    scriptContent: 'echo ${secret}'
    retentionInterval: 'P1D'
    timeout: 'PT30M'
  }
}
