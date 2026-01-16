$number = Read-Host "Enter a number"

$originalNumber = $number

$sum = 0

$digits = $number.Length

for ($i = 0; $i -lt $digits; $i++) {

    $digit = [int]$number[$i]

    $power = 1
    for ($j = 1; $j -le $digits; $j++) {
        $power = $power * $digit
    }

    $sum = $sum + $power
}

if ($sum -eq [int]$originalNumber) {
    Write-Output "The number is an Armstrong number."
} else {
    Write-Output "The number is not an armstrong number."
}