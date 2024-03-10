# login to azure 
az login
az account set --subscription "beaaa6b1-4d49-4c24-bfa0-d0220b1a6f2e"

$ACR_RG_NAME='psdemoacrrg'
$ACR_NAME='psdemoacr2024'

az group create --name $ACR_RG_NAME --location eastus

az acr create --resource-group $ACR_RG_NAME --name $ACR_NAME --sku Standard

az acr login --name $ACR_NAME

$ACR_LOGISERVER = $(az acr show --name $ACR_NAME --query loginServer --output tsv)
Write-Output $ACR_LOGISERVER 

docker tag myexpressapp:1.3 $ACR_LOGISERVER/myexpressapp:1.3
docker image ls $ACR_LOGISERVER/myexpressapp:1.3
docker image ls

# step: push image to our azure container registry
docker push $ACR_LOGISERVER/myexpressapp:1.3

az acr repository  list --name $ACR_NAME  --output table
az acr repository show-tags --name $ACR_NAME --repository myexpressapp --output table

#using ACR TASKS
# Step 1 - use ACR  build to build our image in azure  and then push that into ACR
az acr build --image "myexpressapp:v1-acr-task" --registry $ACR_NAME .

# Both images are in there now, the one we built locally and the one build with ACR tasks
az acr repository show-tags --name $ACR_NAME --repository myexpressapp --output table