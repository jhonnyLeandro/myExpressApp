# login to azure 
az login

# list resource group
az group list --output table

# create resource group 
az group create --name "demovm" --location "eastus"

# createing a windows virtual machine
az vm create --resource-group "demovm" --name "psdemo-win-cli" --image "win2019datacenter" --admin-username "demoadmin" --admin-password "password123$%^&*"

# open port RDP for remote access, it may already be open
az vm open-port --resource-group "demovm" --name "psdemo-win-cli" --port "3389"

# get the ip addresses for remote access
az vm list-ip-addresses --resource-group "demovm" --name "psdemo-win-cli" --output table

