# The steps to work with git using vs code UI
### What is Git?
Git is a version control system used to track changes in code and manage different versions of projects. It helps deelopers collabrate and maintain the code.
### VS Code?
It is one of the code editor that is light in weight. Provides built-in git support, allowing users to manage the remote repositories. 
### BitBucket?
It is a public repository manager used to store the Git repositories online, enabling collobration and deployment.

## Prerequisites:
1. VS Code install
2. Git install 
3. Bitbucket Account

## Steps to work in Git Using VS Code UI

Step 1: Open a folder and create a sample file(here: Week1/Day1/sample.c)

Step 2: Intialize Git
1. In VS code window, the leftside bar contains the git ** Source Control ** Bar 
2. By using that we can intialize the repository
3. Frome there git starts tracking the files 

Step 3: Staging changes
1. By using the **"+"** icon in the source control panel, we can see the files thta are staged (means ready to commit)

Step 4: Commit changes
1. Write a commit message
2. click the commit icon 
3. this saves the changes with the description of what has been changed 

Step 5: Create BitBucket Repository 
1. create a private repository
2. copy the url and clone it here in the VS Code terminal using the git comment git clone * url *

Step 6: Connect VS code to BitBucket
1. add remote repository and sign in if asked 

Step 7: Push Code to remote repository
1. Click sync/publish 
2. Now the code is visible in BitBucket

** Click Source control -> Stage -> Commit -> Push **

### Verification 
Open BitBucket and check whether the files are visible or not 

 
# Git commands:
git init - creates a new repo 
git clone link - clones the repo which already exist
git add file_name - Add the untracked file
git add . - add all the untracked files
git rm file_name - to remove the file
git reset file_name - Unstage the file 
git reset - Unstage everything 
git status - used to check the what to be added
git commit - saves the changes permanently in the Git history
git commit -m "message" - saves the changes with customised message 
git commit -am "message" - saves all the tracked files basically a quick commit 
git commit --amend - to edit the message
git switch branch_name (or) git checkout branch_name - switch the branch
git switch -c branch_name (or) git checkout -b branch_name - creates a new branch
git branch - list the branches
git branch -d branch_name - deletes the branch
git branch -D branch_name - force deletes the branch

## CI/CD pipelines:

### CI (continuous integration) - 
pulls the latest code from Version control -> runs automated test (unit & integrated) -> checks for code quality and security -> build the app

### CD (continuous delivery) - 
code is always production ready and requires approval 
approval is done manually

### CD (continuous deployment) - 
code successful change is deployed automatically

** The main difference between them is the deployement is done manually in continuous deployment and not in continuous delivery **
