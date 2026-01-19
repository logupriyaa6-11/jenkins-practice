function GetCharacterFrequency {
    param (
        [Parameter(Mandatory = $true)]
        [string]$InputString
    )

    try {
        if ([string]::IsNullOrWhiteSpace($InputString)) {
            throw "Input string cannot be empty."
        }

        $characterFrequency = @{}

        foreach ($character in $InputString.ToCharArray()) {
            if ($characterFrequency.ContainsKey($character)) {
                $characterFrequency[$character]++
            }
            else {
                $characterFrequency[$character] = 1
            }
        }

        return $characterFrequency
    }
    catch {
        Write-Error $_
    }
}

try {
    $userInputString = Read-Host "Enter a string"

    $frequencyResult = GetCharacterFrequency -InputString $userInputString

    foreach ($key in $frequencyResult.Keys) {
        Write-Output "$key : $($frequencyResult[$key])"
    }
}
catch {
    Write-Error "Unexpected error occurred."
}