# Git commands
### git init:
creates a new repository 
it will start tracking the folder using git 
output: Initialized empty Git repository in file_path

.git is heart of git
contains:
1. commits
2. branches
3. HEAD (points o current branch)
4. objects (stores commits, trees, blobs)
5. refs (stores branches)

deleting .git will destroy repository

### git clone 
copies the existing remote repository entirely to the local repository (It includes all its previous commits, branches and config)
git clone <repo-url>
it will create a folder, initialize .git inside it 

by using git remote -v we cam get the remote name and url

### git remote -v

This shows the remote name and it's URL

### git status
it shows the current branch 
state of working directory
state of staging area 
what should we do next

### git add
moves changes from working directory to the staging area
It is like informing that these changes needs to be for the next commit
git add <file> will add only the particular file
git add . adds everything 
git add -A adds new files, modified files, deleted files

### git commit
creates a permanent snapshot of the staged changes and store it in git history with a message
until we use commit git history does not change
git commit -m "message"
git reads staging area
creates a tree object 
creates a commit object
updates the branch pointer
moves HEAD

commit object contains:
Tree - snapshot of files 
Parent - Previous commit 
Author - who made chnages 
Committer - who committed 
Date - time stamp
message - Explaination 

commit without message - opens default editor and allows multi-line messages

git commit --amend - modifies the last commit, we can change message, add/remove files

commits are immutable even amend is a new commit

### git log
Displays the commit history of the repository.
command:
git log

It shows:
Commit hash
Author information
Date and time
Commit message

Commits are displayed in reverse chronological order(latest first).

### git log --oneline
Shows a compact version of commit history.

Command:
git log --oneline

This displays:
Short commit hash
Commit message

Useful for quickly reviewing history.

### git log --graph --oneline --all
Displays commit history in a graphical format.

### git diff
Shows the difference between changes.

Command:
git diff

Displays:
Changes in the working directory
Files not yet staged

### git diff --staged
Shows differences between staged changes and the last commit.

Command:
git diff --staged

This helps verify exactly what will be committed

### git show
Displays details of a specific commit.

Command:
git show <commit-hash>

It shows:
Commit metadata
Changes introduced by the commit

Useful for reviewing past changes.

### git reflog
Records every movement of `HEAD`.

Command:
git reflog

It tracks:
Commits
Checkouts
Pulls
Resets
Rebases

Each entry includes:
Commit hash
`HEAD@{n}` indicating action order
Action performed

This command is critical for recovering lost commits