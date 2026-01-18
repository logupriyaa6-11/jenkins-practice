# What is powershell?
automate tasks and manage system from local computers to remote machines and cloud env

- command line shell
- a scriping language
- automation framework
- built on .NET

powershell combines 
command prompt
scripting environment
way to work wih .NET objects

If we use Get-Process we get a structured object and not a plain text
built on .NET so every command returns .NET object 

## Why do we need powershell?
- automate task
- runs in windows, MacOS, linux
- integrate with CI/CD pipelines 
- repeatable and reliable 

for eg., if same task wants to be done on every system in a company then lets go with powershell as the automate the repeated tasks 

# cmdlet:
built in powershell command
- list processes 
- controlling services
- managing files

format: verb-noun

### why do we need cmdlet?
Cmdlets exist to give PowerShell structured, safe, and powerful commands that work with real data and enable automation.

### Execution policy:
PowerShell execution policies control how and when scripts are allowed to run on Windows systems. Enforcement applies only on Windows.

1. **AllSigned**
   - All scripts and configuration files must be digitally signed.
   - Includes scripts written on the local computer.
   - Prompts before running scripts from unknown publishers.
   - Protects against unsigned scripts but can still run signed malicious scripts.

2. **Bypass**
   - No scripts are blocked.
   - No warnings or prompts.
   - Designed for embedded PowerShell or applications with their own security model.
   - Provides no protection against malicious scripts.

3. **Default**
   - Sets PowerShell to the system default execution policy.
   - Default is RemoteSigned on Windows clients and servers

4. **RemoteSigned**
   - Default policy for Windows computers.
   - Local scripts can run without a signature.
   - Scripts downloaded from the internet must be signed.
   - Unsigned downloaded scripts can run if explicitly unblocked.
   - Reduces risk from internet-based scripts.

5. **Restricted**
   - Does not allow any scripts to run.
   - Only individual commands can be executed interactively.
   - Blocks all script files, modules, formatting files, and PowerShell profiles.
   - Most secure but highly restrictive.

6. **Undefined**
   - No execution policy is set in the current scope.
   - PowerShell checks other scopes for a policy.
   - If all scopes are Undefined:
     - Windows client → Restricted
     - Windows Server → RemoteSigned

7. **Unrestricted**
   - Default policy for non-Windows systems.
   - All scripts can run, including unsigned scripts.
   - Warns before running scripts from outside the local intranet.
   - Relies on user judgment and system permissions.

### Execution Policy Scope:
Execution policy scopes define where an execution policy applies. Policies are evaluated in precedence order, and the highest-precedence policy takes effect.

Scopes in precedence order:
MachinePolicy → UserPolicy → Process → CurrentUser → LocalMachine

1. **MachinePolicy**
   - Set using Group Policy.
   - Applies to all users on the computer.
   - Highest precedence.
   - Cannot be overridden by other scopes.
   eg : An organization enforces AllSigned for all users using Group Policy

2. **UserPolicy**
   - Set using Group Policy.
   - Applies only to the current user.
   - Takes precedence over Process, CurrentUser, and LocalMachine.
   eg : A developer user is enforced with RemoteSigned through Group Policy.

3. **Process**
   - Applies only to the current PowerShell session.
   - Stored in the x$Env:PSExecutionPolicyPreference environment variable.
   - Deleted when the session is closed.
   - Useful for temporary policy changes.
   eg : Temporary testing or running a script without changing system policy.

4. **CurrentUser**
   - Applies only to the current user.
   - Stored in the CurrentUser configuration file.
   - Overrides LocalMachine but not Process or Group Policy scopes.
   eg : when user wants to run scripts without affecting other users.

5. **LocalMachine**
   - Applies to all users on the computer.
   - Stored in the AllUsers configuration file.
   - Default scope when setting an execution policy.
   - Lowest precedence.
   eg : A shared lab computer is used by multiple users. The administrator wants to prevent all users from running PowerShell scripts to avoid accidental or malicious changes.

## Task
Write a PowerShell script to set execution policy (as unrestricted) using parameters.

**script**
function setExecPolicy {
   param {
      [string]$policy
   }

   try {
      if (-not $policy) {
         $policy = Read-Host "Enter the execution policy "
      }

      if ([string]::IsNullOrWhiteSpace($policy)) {
         throw "Invalid input"
      }

      Set-ExecutionPolicy -ExecutionPolicy $policy -Scope CurrentUser

      write-host "$policy is set to current user"
   }
   catch {
     write-host "Error"
   }
}
setExecPolicy

here, 
param - variable declared inside this block
[string] - it is a datatype 
$Policy - variable name (the $Policy will be in string data structure)
Set-ExecutionPolicy - built-in powershell command to change script execution rules
-ExecutionPolicy - it is the paramenter of commandlet
$Policy -  value passed from script

user input will be given to $Policy variable to the cmdlet Set-ExecutionPolicy

-Scope CurrentUser - limits the scope to only logged-in users

**execution**
PS C:\Users\logupriya.a\devops_logupriyaa\Week1\Day3> .\execution_policy.ps1
Enter the execution policy: : Restricted
Restricted is set to current user

param block takes the input
$Policy stores it 
Set-ExecutionPolicy applies it 
Scope limits changes to current user 

 get-executionpolicy -list

        Scope ExecutionPolicy
        ----- ---------------
MachinePolicy       Undefined
   UserPolicy       Undefined
      Process       Undefined
**CurrentUser      Restricted**
 LocalMachine    RemoteSigned