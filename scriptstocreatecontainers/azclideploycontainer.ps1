az login
az account set --subscription "beaaa6b1-4d49-4c24-bfa0-d0220b1a6f2e"

$ACR_RG_NAME='psdemoacrrg'
$ACI_NAME='my-express-test-container-02'
$ACR_NAME='psdemoacr2024'

# Obtain the full registry ID
$ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query "id" --output tsv)

$SP_PASSWD=$(az ad sp create-for-rbac --name http://$ACR_NAME-pulll --scopes $ACR_REGISTRY_ID --role acrpull --query "password" --output tsv)

Write-Host "SP_PASSWD: "$SP_PASSWD

$SP_APPID=$(az ad sp list --display-name http://$ACR_NAME-pulll --query "[].appId" --output tsv)

Write-Host "SP_APPID: "$SP_APPID

$ACR_LOGISERVER = $(az acr show --name $ACR_NAME --query loginServer --output tsv)

Write-Host "ACR_LOGISERVER : "$ACR_LOGISERVER 

az container create `
    --resource-group $ACR_RG_NAME `
    --name $ACI_NAME `
    --dns-name-label $ACI_NAME `
    --ports 3000 `
    --image $ACR_LOGISERVER/myexpressapp:1.3 `
    --registry-login-server $ACR_LOGISERVER `
    --registry-username $SP_APPID `
    --registry-password $SP_PASSWD


az container show --resource-group $ACR_RG_NAME --name $ACI_NAME


# get the url from the container
$URL=$(az container show --resource-group $ACR_RG_NAME --name $ACI_NAME --query ipAddress.fqdn | tr -d '"')

Write-Host "URL: "+$URL 

az container logs --resource-group $ACR_RG_NAME --name $ACI_NAME