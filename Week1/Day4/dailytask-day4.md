# Modules 

Module is a container which has many scripts

### why do we need modules?
Instead of writting the same scripts anf=gain and again, we put them in a module and reuse them whenever needed. W e can use it any where

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

but when we use -Force with the install command then this prompt will not be shown

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