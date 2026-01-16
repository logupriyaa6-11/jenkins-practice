$string = Read-Host "Enter a string"

for ($i = 0; $i -lt $string.Length; $i++) {

    $count = 0

    for ($j = 0; $j -lt $string.Length; $j++) {
        if ($string[$i] -eq $string[$j]) {
            $count++
        }
    }

    $alreadyCounted = $false
    for ($k = 0; $k -lt $i; $k++) {
        if ($string[$i] -eq $string[$k]) {
            $alreadyCounted = $true
            break
        }
    }

    if (-not $alreadyCounted) {
        Write-Output "$($string[$i]) : $count"
    }
}