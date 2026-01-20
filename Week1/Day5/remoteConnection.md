# Interactive PowerShell Remoting Using WinRM
## What This Is  
PowerShell Remoting allows a user to open a live session on a remote system, run commands there, and receive the output on the local machine.  
The successful change of the PowerShell prompt and execution of commands confirm that the remote connection is working correctly.

## Environment Information
- Local system: Windows PowerShell (Administrator mode)
- Remote virtual machine IP: 135.235.169.49
- Username: test_user
- Connection method: PowerShell Remoting (WinRM)
- Session type: Interactive

## Step-by-Step Execution and PowerShell State
### Step 1:Check PowerShell Version
$PSVersionTable.PSVersion

What it does:
Checks that PowerShell supports remote connections.

### Step 2: Check WinRM Service
Get-Service WinRM

What it does:
Checks if the service used for remote connections is running.

### Step 3: Start WinRM
Start-Service WinRM

What it does:
Starts the WinRM service so remote access is possible.

### Step 4: Add Remote System to TrustedHosts
Set-Item WSMan:\localhost\Client\TrustedHosts -Value 4.247.173.88

What it does:
Allows PowerShell to trust the remote system since both systems are not in the same domain.

### Step 5: Verify TrustedHosts
Get-Item WSMan:\localhost\Client\TrustedHosts

What it does:
Confirms the remote IP is added correctly.

### Step 6: Enter Credentials
$credential = Get-Credential

What it does:
Asks for username and password securely.

### Step 7: Test remote connection
Test-WSMan 4.247.173.88

What it does:
Checks if the remote system is reachable using WinRM.

### Step 8: Connect to remote system
Enter-PSSession -ComputerName 4.247.173.88 -Credential $credential

What it does:
Starts an interactive PowerShell session on the remote machine.

### Step 9: Verify Connection
hostname
whoami

What it does:
Confirms you are connected to the remote machine and user.

### Step 10: Exit Remote Session
Exit-PSSession

What it does:
Closes the remote connection and returns to the local system.   