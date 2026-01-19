function getReversedString {
    param (
        [Parameter(Mandatory = $true)]
        [string]$InputString
    )

    try {
        if ([string]::IsNullOrWhiteSpace($InputString)) {
            throw "Input string cannot be empty."
        }

        $reversedString = ""

        for ($characterIndex = $InputString.Length - 1; $characterIndex -ge 0; $characterIndex--) {
            $reversedString += $InputString[$characterIndex]
        }

        return $reversedString
    }
    catch {
        Write-Error $_
    }
}

try {
    $userInputString = Read-Host "Enter a string"

    $result = getReversedString -InputString $userInputString
    Write-Output "Reversed string is: $result"
}
catch {
    Write-Error "Unexpected error occurred."
}