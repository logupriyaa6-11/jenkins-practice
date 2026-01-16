$string = Read-Host "Enter a string"

$reverse = ""

for ($i = $string.Length - 1; $i -ge 0; $i--) {
    $reverse = $reverse + $string[$i]
}

Write-Output "Reversed string is: $reverse"