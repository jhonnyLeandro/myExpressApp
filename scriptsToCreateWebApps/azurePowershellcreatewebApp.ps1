# create variable
$webappname = "mywebapp$(Get-Random)"
$rgname = "webappsdev-rg$(Get-Random)"
$location = "eastus"

# Create a resource group
New-AzResourceGroup -Name $rgname -Location $location

# create an app service plant in s2 tier
New-AzAppServicePlan -Name $webappname -Location $location -ResourceGroupName $rgname -Tier s1

# Create a web app
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName $rgname
