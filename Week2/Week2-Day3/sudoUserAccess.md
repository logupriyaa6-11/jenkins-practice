# Create a new user, set a password, assign sudo access, and assign it to a group.
priya1107@ITT-LOGUPRIYA-A:/mnt/c/Users/logupriya.a/study$ sudo adduser priya123

sudo adduser priya123 - This command adds the user (sudo is used here because the normal user don't have the permissions to add users)

[sudo] password for priya1107:
info: Adding user `priya123' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `priya123' (1001) ... 
info: Adding new user `priya123' (1001) with group `priya123 (1001)' ...
info: Creating home directory `/home/priya123' ...
info: Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for priya123
Enter the new value, or press ENTER for the default
        Full Name []: Logupriya
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y
info: Adding new user `priya123' to supplemental / extra groups `users' ...
info: Adding user `priya123' to group `users' ...


priya1107@ITT-LOGUPRIYA-A:/mnt/c/Users/logupriya.a/study$ sudo passwd priya123

sudo passwd priya123 - This command is used to set password to user (using sudo here because the normal user doesn't have access to modify or reset the password)

New password:
Retype new password:
passwd: password updated successfully


priya1107@ITT-LOGUPRIYA-A:/mnt/c/Users/logupriya.a/study$ sudo usermod -aG sudo priya123

sudo usermod -aG sudo priya123 - used to add users to the group 
sudo usermod -aG groupname username
usermod - user modify 
-a - append (if we don't append the user may lose the previous groups)
G - supplementary groups
groupname - sudo (to which group they wants to be added)
username - priya123 (which user wants to be added to that group)

priya1107@ITT-LOGUPRIYA-A:/mnt/c/Users/logupriya.a/study$ groups priya123
priya123 : priya123 sudo users

groups username - used to show the group membership
here, 
username : priya123
groups:
- priya123
- sudo
- users

# Find all .log files in /var/log/ older than 7 days.

priya1107@ITT-LOGUPRIYA-A:/mnt/c/Users/logupriya.a/study$ sudo find /var/log -type f -name "*.log" -mtime +7
/var/log/landscape/sysinfo.log
/var/log/bootstrap.log
/var/log/fontconfig.log

find - keyword used to find the files and directories
file location - here, /var/log
-type - parameter used to specify the type of file
f - denotes files (d - directories, l - links)
-name - parameter used to find specify the file (here * represents all the file which is log) 
-mtime - parameter used to specify the time period (exact number - list only the files which are modified on that day, +number - before that specific day, -number - after that specific day)

# Change permissions of /opt/devops/scripts so only the owner can read/write

priya1107@ITT-LOGUPRIYA-A:/opt/devops$ sudo chmod 700 /opt/devops/scripts

sudo chmod 700 /opt/devops/scripts:
why sudo here?
the owner of the directory is root and normal users can't modify the permissions

priya1107@ITT-LOGUPRIYA-A:/opt/devops$ ls -ld /opt/devops/scripts
drwx------ 2 root root 4096 Jan 21 08:14 /opt/devops/scripts

ls -ld: lists the detailed specification of directories 