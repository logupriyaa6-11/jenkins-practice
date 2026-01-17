PS C:\Windows\System32> $Session = New-PSSession -ComputerName $RemoteComputer -Credential $Credential
PS C:\Windows\System32> ping 135.235.169.49

Pinging 135.235.169.49 with 32 bytes of data:
Request timed out.
Request timed out.
Request timed out.
Request timed out.

Ping statistics for 135.235.169.49:
    Packets: Sent = 4, Received = 0, Lost = 4 (100% loss),
PS C:\Windows\System32> Test-WSMan 135.235.169.49

wsmid           : http://schemas.dmtf.org/wbem/wsman/identity/1/wsmanidentity.xsd
ProtocolVersion : http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd
ProductVendor   : Microsoft Corporation
ProductVersion  : OS: 0.0.0 SP: 0.0 Stack: 3.0

PS C:\Windows\System32> Test-Path "C:\Temp\demo.txt"
True
PS C:\Windows\System32> Copy-Item `
>>   -Path "C:\Temp\demo.txt" `
>>   -Destination "C:\Users\Public\Desktop\demo.txt" `
>>   -ToSession $Session `
>>   -Force
PS C:\Windows\System32> Invoke-Command -Session $Session -ScriptBlock {
>>     Test-Path "C:\Users\Public\Desktop\demo.txt"
>> }
True

## 1. Creating a PowerShell Remoting Session

$Session = New-PSSession -ComputerName $RemoteComputer -Credential $Credential

What this does:
Creates a PowerShell Remoting (WinRM) session to the remote computer.
Uses explicit credentials.
Relies on WinRM (WS-Management), not ICMP (ping).

If this command succeeds, it means:
WinRM is enabled on the remote machine.
Authentication and authorization were successful.
Required ports (typically TCP 5985/5986) are open.

### 2. Ping Failure (ICMP)
### 3.Verifying WinRM Connectivity
### 4. Verifying Local File Exists
### 5. Copying a File to the Remote Machine
### 6. Verifying the File on the Remote System