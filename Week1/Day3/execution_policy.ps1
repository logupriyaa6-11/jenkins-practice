$policy = read-host "Enter the policy"
$scope = read-host "Enter the scope"

function setExecPolicy {
    param (
        [string]$policy
    )
    try {
        if (-not $policy) {
            $policy = Read-Host "Enter the execution policy "
        }

        if ([string]::IsNullOrWhiteSpace($policy)) {
            throw "Invalid input"
        }

        Set-ExecutionPolicy -ExecutionPolicy $policy -Scope CurrentUser

        write-host "$policy is set to current user"
    }
    catch {
        write-host "Error: $($_.Exception.Message)"

    }
}

setExecPolicy -Policy $policy -Scope $scope