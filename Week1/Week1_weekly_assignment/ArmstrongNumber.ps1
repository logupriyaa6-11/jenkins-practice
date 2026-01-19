function Test-ArmstrongNumber {
    param (
        [Parameter(Mandatory = $true)]
        [string]$InputNumber
    )
    try {
        if ([int]$InputNumber -lt 0) {
            throw "Input must be a positive integer."
        }
        $digitCount = $InputNumber.Length
        $armstrongSum = 0

        foreach ($digitChar in $InputNumber.ToCharArray()) {
            $digit = [int]$digitChar
            $powerResult = 1

            for ($powerIndex = 1; $powerIndex -le $digitCount; $powerIndex++) {
                $powerResult *= $digit
            }

            $armstrongSum += $powerResult
        }

        return ($armstrongSum -eq [int]$InputNumber)
    }
    catch {
        Write-Error $_
    }
}

try {
    $userInput = Read-Host "Enter a number"

    if (Test-ArmstrongNumber -InputNumber $userInput) {
        Write-Output "The number is an Armstrong number."
    }
    else {
        Write-Output "The number is not an Armstrong number."
    }
}
catch {
    Write-Error "Unexpected error occurred."
}