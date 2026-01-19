function testPalindrome {
    param (
        [Parameter(Mandatory = $true)]
        [string]$InputWord
    )

    try {
        if ([string]::IsNullOrWhiteSpace($InputWord)) {
            throw "Input cannot be empty."
        }

        $reversedWord = ""

        for ($index = $InputWord.Length - 1; $index -ge 0; $index--) {
            $reversedWord += $InputWord[$index]
        }

        return ($InputWord -eq $reversedWord)
    }
    catch {
        Write-Error $_
    }
}

try {
    $userInputWord = Read-Host "Enter a word"

    if (testPalindrome -InputWord $userInputWord) {
        Write-Output "The word is a palindrome."
    }
    else {
        Write-Output "The word is not a palindrome."
    }
}
catch {
    Write-Error "Unexpected error occurred."
}