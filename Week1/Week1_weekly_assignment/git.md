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

## Git Workflow Strategies
A Git workflow is a set of steps that explains how developers use Git to manage code changes. It defines how work is created, reviewed, and saved in a repository.
Using a workflow helps teams:
- Work in an organized way, Avoid conflicts
- Track changes easily

## Why Git Workflows Are Important
Git workflows are important because they:
- Keep the code clean, Help multiple people work together
- Reduce errors, Make collaboration easier

## Common Git Workflow Strategies
### Centralized Workflow
How it works:
- One main branch (usually main)
- Everyone pushes changes to the same branch

### Feature Branch Workflow
In this workflow, each new feature is developed in a separate branch.
How it works:
- Create a new branch for a feature, Work on the feature
- Merge it back to the main branch

### Git Flow Workflow
This workflow uses multiple branches for different purposes.
Main branches:
main – production-ready code
develop – ongoing development

### Forking Workflow
This workflow is commonly used in open-source projects.
How it works:
- Each developer creates a copy (fork) of the repository
- Changes are made in the fork
- Changes are sent back using pull requests

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
## 4. Steps to Resolve a Merge Conflict
### Step 1: Open the Conflicted File
Open the file that Git has marked as conflicted.

### Step 2: Review the Changes
Carefully review:
- Content from the current branch
- Content from the incoming branch

### Step 3: Resolve the Conflict
Resolve the conflict by:
- Choosing one version of the content, or Combining both changes, or Writing a completely new version
Remove all conflict markers after resolving.

### Step 4: Add the Resolved File
Once resolved, add the file to the staging area: git add <file-name>

### Step 5: Complete the Merge
Finalize the merge by committing: git commit

## 5. Commands Used During Conflict Resolution
- `git status` – Shows conflicted files
- `git checkout --ours <file>` – Keeps current branch changes
- `git checkout --theirs <file>` – Keeps incoming branch changes
- `git merge --abort` – Cancels the merge

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