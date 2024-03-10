az login
az account set --subscription "beaaa6b1-4d49-4c24-bfa0-d0220b1a6f2e"

$ACI_NAME='my-express-test-container-01'
$ACR_RG_NAME='psdemoacrrg'

az container create `
    --resource-group $ACR_RG_NAME `
    --name $ACI_NAME `
    --dns-name-label $ACI_NAME `
    --ports 3000 `
    --image mcr.microsoft.com/azuredocs/aci-helloworld 

# show the container info
az container show --resource-group $ACR_RG_NAME --name $ACI_NAME