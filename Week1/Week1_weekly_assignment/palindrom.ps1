$word = Read-Host "Enter a word"

$reverse = ""

for ($i = $word.Length - 1; $i -ge 0; $i--) {
    $reverse = $reverse + $word[$i]
}

if ($word -eq $reverse) {
    Write-Output "The word is a palindrome."
} else {
    Write-Output "The word is NOT a palindrome."
}