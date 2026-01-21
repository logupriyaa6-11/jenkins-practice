# Sudo commands
### What sudo Is
- sudo stands for “superuser do”
- It allows a normal user to run commands with root (admin) privileges
- It is used instead of logging in as root (safer)

### Why sudo Is Needed
You need sudo when a command:
Modifies system directories (/opt, /etc, /var)
Changes users or groups
Changes permissions or ownership
Installs software
Starts/stops services

sudo chmod 700 /opt/devops/scripts
without sudo we get error: Operation not permitted

### What sudo Actually Does (Behind the Scenes)
Checks /etc/sudoers
Verifies if your user is allowed
Asks for your password (not root’s)
Temporarily runs the command as root
Logs the action

### commands
sudo adduser username - creating user
sudo adduser - adds the user
sudo passwd username - set the password

sudo usermod -aG groupanme username- add user to group