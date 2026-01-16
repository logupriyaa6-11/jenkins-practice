$year = Read-Host "Enter a year"

$year = [int]$year

$isLeapYear = $false

if (($year % 400 -eq 0) -or (($year % 4 -eq 0) -and ($year % 100 -ne 0))) {
    $isLeapYear = $true
}

if ($isLeapYear) {
    Write-Output "The year is a Leap Year."
} else {
    Write-Output "The year is NOT a Leap Year."
}