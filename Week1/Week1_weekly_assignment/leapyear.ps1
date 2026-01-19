function testLeapYear {
    param (
        [Parameter(Mandatory = $true)]
        [int]$Year
    )

    try {
        if ($Year -lt 1) {
            throw "Year must be a positive integer."
        }

        if (($Year % 400 -eq 0) -or (($Year % 4 -eq 0) -and ($Year % 100 -ne 0))) {
            return $true
        }
        else {
            return $false
        }
    }
    catch {
        Write-Error $_
    }
}

try {
    $userInputYear = Read-Host "Enter a year"

    if (-not ($userInputYear -match '^\d+$')) {
        throw "Invalid input. Please enter a numeric year."
    }

    if (testLeapYear -Year ([int]$userInputYear)) {
        Write-Output "The year is a Leap Year."
    }
    else {
        Write-Output "The year is NOT a Leap Year."
    }
}
catch {
    Write-Error "Unexpected error occurred: $_"
}