## GIT COMMANDS HANDS-ON
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

## Git Workflow Strategies
A Git workflow is a set of steps that explains how developers use Git to manage code changes. It defines how work is created, reviewed, and saved in a repository.

Using a workflow helps teams:
- Work in an organized way
- Avoid conflicts
- Track changes easily

## Why Git Workflows Are Important
Git workflows are important because they:
- Keep the code clean
- Help multiple people work together
- Reduce errors
- Make collaboration easier

## Common Git Workflow Strategies
### Centralized Workflow
How it works:
- One main branch (usually main)
- Everyone pushes changes to the same branch

Best for:
Small teams
Beginners

### Feature Branch Workflow
In this workflow, each new feature is developed in a separate branch.

How it works:
- Create a new branch for a feature
- Work on the feature
- Merge it back to the main branch

Benefits:
- Main branch stays stable
- Easy to manage features

### Git Flow Workflow
This workflow uses multiple branches for different purposes.

Main branches:
main – production-ready code
develop – ongoing development

Other branches:
- Feature branches
- Release branches
- Hotfix branches

Best for:
- Large projects
- Structured development

### Forking Workflow
This workflow is commonly used in open-source projects.

How it works:
- Each developer creates a copy (fork) of the repository
- Changes are made in the fork
- Changes are sent back using pull requests

Benefits:
- High security
- No direct access to main repository

## Choosing the Right Workflow
The choice of workflow depends on:
- Team size
- Project complexity
- Level of control needed

Simple projects use simple workflows, while large projects use structured workflows.

# Merge conflicts resolution
## 1. What Is a Merge Conflict?
A **merge conflict** happens when Git is unable to automatically combine changes from different branches.
This usually occurs when:
- The same file is modified in multiple branches
- The same line of code is changed differently

Git stops the merge process and asks the user to resolve the conflict manually.

## 2. Why Merge Conflicts Occur
Merge conflicts occur because Git cannot decide:

- Which change should be kept
- Which version of the code is correct

To avoid making wrong decisions, Git leaves the final choice to the developer.
## 3. How Git Shows a Merge Conflict

When a conflict occurs, Git marks the conflicted file with special symbols:
<<<<<<< HEAD
Content from current branch
=======
Content from incomming branch
>>>>>>>
These markers help identify:
- Current branch content
- Incoming branch content

## 4. Steps to Resolve a Merge Conflict
### Step 1: Open the Conflicted File
Open the file that Git has marked as conflicted.

### Step 2: Review the Changes
Carefully review:
- Content from the current branch
- Content from the incoming branch

### Step 3: Resolve the Conflict
Resolve the conflict by:
- Choosing one version of the content, or
- Combining both changes, or
- Writing a completely new version

Remove all conflict markers after resolving.

### Step 4: Add the Resolved File
Once resolved, add the file to the staging area:
git add <file-name>

### Step 5: Complete the Merge
Finalize the merge by committing:
git commit

## 5. Commands Used During Conflict Resolution
- `git status` – Shows conflicted files
- `git checkout --ours <file>` – Keeps current branch changes
- `git checkout --theirs <file>` – Keeps incoming branch changes
- `git merge --abort` – Cancels the merge

## 6. Important Points to Remember
- Git never auto-resolves conflicting changes
- Manual review is always required
- Always test after resolving conflicts
- Commit only after all conflicts are resolved

## Git commands:
git init - Initialize a new Git repository
git status - Show the current status of the working directory
git add - Add a file to the staging area
git add . - Add all files to the staging area
git commit -m "message" - Save staged changes with a message
git log - Display detailed commit history
git log --oneline - Display commit history in short format
git branch - List all local branches
git branch -r - List remote branches
git branch -a - List all branches (local and remote)
git checkout - Switch to the specified branch
git checkout -b - Create and switch to a new branch
git merge - Merge specified branch into current branch
git merge --abort - Abort an ongoing merge
git pull - Fetch and merge changes from remote repository
git pull --rebase - Fetch changes and reapply local commits
git fetch - Fetch changes without merging
git push - Push local commits to remote repository
git push origin - Push a specific branch to remote
git push -u origin - Push branch and set upstream
git push --force - Force push changes to remote
git push --dry-run - Preview push without actual push
git clone - Create a local copy of a remote repository
git reset - Move HEAD to a specific commit
git reset --soft - Reset HEAD and keep changes staged
git reset --mixed - Reset HEAD and unstage changes
git reset --hard - Reset HEAD and discard all changes
git revert - Undo a commit by creating a new commit
git reflog - Show history of HEAD movements
git stash - Save uncommitted changes temporarily
git stash pop - Restore latest stashed changes
git restore - Restore file from last commit
git restore --staged - Unstage a file