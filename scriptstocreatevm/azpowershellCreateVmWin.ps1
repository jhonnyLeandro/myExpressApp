#Connect-AzAccount -UseDeviceAuthentication 
#Set-AzContext -Subscription "beaaa6b1-4d49-4c24-bfa0-d0220b1a6f2e"
#Let's login, may la

$username = 'demoadmin'
$password = ConvertTo-SecureString 'password123$%^&*' -AsPlainText -Force
$WindowsCred = New-Object System.Management.Automation.PSCredential ($username, $password)

New-AzResourceGroup -Name "psdemo-rg" -Location "EastUS"

New-AzVM  -ResourceGroupName "psdemo-rg"  -Name "psdemo-win-az"  -Location "EastUS" -Image "Win2019Datacenter"  -Credential $WindowsCred  -OpenPorts 3389

Get-AzPublicIpAddress -ResourceGroupName 'psdemo-rg' -Name 'psdemo-win-az' | Select-Object IpAddress 


#Remove-AzResourceGroup -Name "psdemo-rg"