# Modules 

Module is a container which has many scripts

### why do we need modules?
Instead of writting the same scripts again and again, we put them in a module and reuse them whenever needed. W e can use it any where

### What a module can have?
- cmdlet
- functions
- variables
- helpfiles
- other scripts

### where do modules be there?
Powershell looks for module in special folder called module path 

by using the following command we can check the module path:
$Env:PSModulePath


### how to install?
Modules come from powershell gallery

command to install the module:
Install-Module -name (module_name) -scope CurrentUser

It will give a prompt:
do you trust this repository

command to import the module:
Import-Module (module_name)

command to check if it is loaded:
Get-Module

command to check available modules:
Get-Module -ListAvailable 

command to find commands in a module:
Get-Command -Module (module_name)

 - command to find only the functions in a module
    Get-Command -Module (module_name) -CommandType Function
 - command to find only the cmdlets
    Get-Command -Module (module_name) -CommandType cmdlet

command to remove a module:
Remove-Module (module_name)

command to uninstall a module:
Uninstall-Module (module_name) -AllVersion -Force

### Explaination:
$moduleName = Read-Host "Enter the module name to install"
$scope = Read-Host "Enter the scope"

function installModule {
    param (
        [Parameter(Mandatory = $true)]
        [string]$moduleName,

        [Parameter(Mandatory = $true)]
        [string]$scope
    )
    try {
        Write-Host "Checking if module '$moduleName' is already installed"

        $existingModule = Get-Module -ListAvailable -Name $moduleName

        if (-not $existingModule) {
            Write-Host "Module not found. Installing '$moduleName'"

            Install-Module -Name $moduleName -Scope $scope
        }
        else {
            Write-Host "Module '$moduleName' is already installed."
        }

        Write-Host "Importing module '$moduleName'"
        Import-Module $moduleName 

        Write-Host "Available commands in module '$moduleName'"
        Get-Command -Module $moduleName
    }
    catch {
        Write-Host "error"
    }
}

installModule -ModuleName $moduleName -Scope $scope

1. declaring and reading the input from user
2. defining function
   - inside funtion, there is a param block 
   - the madatory refers to required feild
   - this takes input from the pipeline
   - type casting the input as string
3. To prevent the module reinstalling, we check whether it is already available or not 
4. then the module is imported and by using get command we could see i=the commands available inside the module 
5. here the 'Az' module is quite big so we have to specify function of the module