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