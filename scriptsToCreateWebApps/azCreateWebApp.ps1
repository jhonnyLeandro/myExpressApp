# login to azure 
az login

# create resource group 
az group create --name "web-app-test" --location "eastus"

az appservice plan create --name "ps-demo-test-app-service-plan" `
    --resource-group "web-app-test" `
    --sku s1 `
    --is-linux

az webapp create -g  "web-app-test" `
    -p "ps-demo-test-app-service-plan" `
    -n "ps-web-app-test-01" `
    --runtime "node|18 lts"