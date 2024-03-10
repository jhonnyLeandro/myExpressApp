$ACR_RG_NAME='psdemoacrrg'
$ACR_NAME='psdemoacr2024'

$ACR_LOGISERVER=$(az acr show --name $ACR_NAME --query id --output tsv)

$SP_NAME="acr.service-principal"
$SP_PASSWD=$(az ad sp create-for-rbac --name http://$ACR_NAME-pull --scopes $ACR_REGISTRY_ID --role acrpull --query password --output tsv)

$SP_APPID=$(az ad sp show --id http://$ACR_NAME-pull --query appId --output tsv )

$ACR_LOGISERVER = $(az acr show --name $ACR_NAME --query loginServer --output tsv)

az container create `
    --resource-group $ACR_RG_NAME `
    --name psdemo-expressapp-cli `
    --dns-name-label psdemo-expressapp-cli `
    --ports 3000 `
    --image $ACR_LOGISERVER/myexpressapp:1.3 `
    --registry-login-server $ACR_LOGISERVER `
    --registry-username $SP_APPID `
    --registry-password $SP_PASSWD
