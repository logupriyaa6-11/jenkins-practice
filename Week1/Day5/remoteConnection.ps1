Set-Item WSMan:\localhost\Client\TrustedHosts -Value "135.235.169.49" -Force

Get-Item WSMan:\localhost\Client\TrustedHosts

$remoteIP = "135.235.169.49"
$username = "test_user"
$password = "TestUser@1234"
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($username, $securePassword)

$session = New-PSSession -ComputerName $remoteIP -Credential $cred
Enter-PSSession -Session $session

Exit-PSSession