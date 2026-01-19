function Open-RemoteSession {
    param (
        [Parameter(Mandatory = $true)]
        [string]$TargetIP
    )

    try {
        Write-Host "Checking PowerShell version" 
        $PSVersionTable.PSVersion

        Write-Host "Verifying WinRM service" 
        $service = Get-Service -Name WinRM

        if ($service.Status -eq 'Stopped') {
            Write-Host "Starting WinRM service" 
            Start-Service -Name WinRM
        }

        Write-Host "WinRM service status:" 
        Get-Service -Name WinRM

        Write-Host "Adding remote system to TrustedHosts" 
        Set-Item WSMan:\localhost\Client\TrustedHosts -Value $TargetIP
        Get-Item WSMan:\localhost\Client\TrustedHosts

        Write-Host "Collecting credentials" 
        $credential = Get-Credential

        Write-Host "Testing WinRM connectivity to $TargetIP" 
        Test-WSMan -ComputerName $TargetIP

        Write-Host "Opening remote PowerShell session..." 
        Enter-PSSession -ComputerName $TargetIP -Credential $credential
    }
    catch {
        Write-Host "Remote connection failed" 
        Write-Host $_.Exception.Message
    }
}

$ipAddress = "4.247.173.88"
Open-RemoteSession -TargetIP $ipAddress