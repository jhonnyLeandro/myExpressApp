Set-AzContext -Subscription "beaaa6b1-4d49-4c24-bfa0-d0220b1a6f2e"

New-AzResourceGroupDeployment -Name mydeployment -ResourceGroupName 'demovm' -TemplateFile './templateVmWin/template.json' -TemplateParameterFile './templateVmWin/parameters.json'