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
### Step 1: Starting Windows PowerShell
Windows PowerShell is launched with Administrator privileges.

PowerShell state:
- Running on the local machine
- No remote session is active
- Ready to configure WinRM settings

### Step 2: Adding the Remote System to TrustedHosts
Command executed:
```powershell
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "135.235.169.49" -Force

Explanation:
The local system and the remote VM are not part of the same domain
TrustedHosts allows WinRM connections in a workgroup environment

Verification command:
Get-Item WSMan:\localhost\Client\TrustedHosts

Confirmed output:
Value : 135.235.169.49

PowerShell state:
Still operating locally
Remote system is now trusted for WinRM communication

### Step 3: Defining Remote Connection Variables
Commands executed:

$remoteIP = "135.235.169.49"
$username = "test_user"
$password = "TestUser@1234"

PowerShell state:
Local PowerShell session
Connection details stored in variables for later use

### Step 4: Creating Secure Credentials
Commands executed:
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($username, $securePassword)

Explanation:
The password is converted into a secure string
A credential object is created for safe authentication

PowerShell state:
Local session
Credentials prepared for remote login

### Step 5: Creating the Remote PowerShell Session
Command executed:
$session = New-PSSession -ComputerName $remoteIP -Credential $cred

Explanation:
A remote session is created in the background
The session is not interactive yet

PowerShell state:
Local machine
Remote session exists but is not entered

### Step 6: Entering the Interactive Remote Session
Command executed:
Enter-PSSession -Session $session

Explanation:
PowerShell switches control to the remote virtual machine
The prompt changes to indicate a remote session

PowerShell state:
Interactive remote session is active
All commands now run on the remote system

verification:
[135.235.169.49]: PS C:\Users\test_user\Documents>

### Step 7: Running Commands on the Remote System
Commands executed:
hostname
whoami
Get-Date

Explanation:
hostname confirms the remote system name
whoami confirms the authenticated user
Get-Date shows the remote system time

PowerShell state:
Fully interactive
Commands executed on the remote VM

### Step 8: Exiting the Remote Session
Command executed:
Exit-PSSession

Explanation:
The interactive remote session is closed
Control returns to the local system

PowerShell state:
Back in local PowerShell
Remote session successfully ended