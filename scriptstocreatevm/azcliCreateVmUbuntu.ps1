# login to azure 
az login

# list resource group
az group list --output table

# create resource group 
az group create --name "demovm" --location "eastus"

# createing a windows virtual machine
az vm create --resource-group "demovm" --name "psdemo-ubu-cli" --image "Ubuntu2204" --admin-username "demoadmin" --authentication-type "ssh"

# open port RDP for remote access, it may already be open
az vm open-port --resource-group "demovm" --name "psdemo-ubu-cli" --port "22"

# get the ip addresses for remote access
az vm list-ip-addresses --resource-group "demovm" --name "psdemo-ubu-cli" --output table


# access vm
ssh demovm@PUBLIC_IP


## delete resource group
az group delete --name "demovm"