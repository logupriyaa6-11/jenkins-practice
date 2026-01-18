# Git commands on merge and merge conflict
 ## git commands

 git checkout branch_name (here the branch name is the destination where the merge will be done)
 git merge branch_name (here the branch_name is the source from where the contents will be added o the destination branch)

 It brings the code to desination branch

 compare commits -> combines changes

 # Merge conflict

 Lets say we have a file conflict.txt in main branch 
 the content in that file is "This is main branch"

 creating a branch named Day2
 editing the same conflict.txt file with "This is Day 2 branch"

 creating a branch named Day2Confict
 editinf the same file conflict.txt with "This is Day 2 conflict"

 Now checkout to main
 merge Day2 branch with main
 merge Day2Conflict with main

 Now the conflict arises 
 because we have changes from 2 branch on the same file 

 ![Merge conflict] (mergeconflict.png)

 Git will not assume itself and merge them
 It will ask us to resolve we need to resolve it manually by replacing the entire text with a new text or else 
 we need to choose from which branch we need the content to be merged 

# Git Commands – Merge and Conflict Handling

## git checkout
Used to switch to a branch.

This command is commonly used to move to the destination branch before performing a merge.

**Command:**
git checkout <branch-name>


## git checkout -b
Used to create a new branch and switch to it.

**Command:**
git checkout -b <branch-name>


## git merge
Used to merge changes from one branch into the current branch.

**Command:**
git merge <branch-name>

The contents of the source branch are added to the destination branch.


## git merge --abort
Used to cancel an ongoing merge operation.

**Command:**
git merge --abort

This restores the repository to the state before the merge started.

## git checkout --ours
Used during a merge conflict to keep changes from the current branch.

**Command:**
git checkout --ours <file-name>


## git checkout --theirs
Used during a merge conflict to keep changes from the incoming branch.

**Command:**
git checkout --theirs <file-name>


## git branch
Used to list local branches.

**Command:**
git branch

The current branch is marked with `*`.


## git branch -r
Used to list remote branches.

**Command:**
git branch -r


## git branch -a
Used to list all branches (local and remote).

**Command:**
git branch -a


## git fetch
Used to fetch updates from the remote repository.

**Command:**
git fetch

This updates remote-tracking branches without merging changes.


## git pull
Used to fetch and merge changes from the remote repository.

**Command:**
git pull


## git pull --rebase
Used to fetch changes and reapply local commits on top of the fetched branch.

**Command:**
git pull --rebase

## git show
Used to view details of a commit.

**Command:**
git show <commit-hash>


## git reflog
Used to view the history of HEAD movements.

**Command:**
git reflog

This helps in recovering commits after merge, reset, or rebase operations.

## git log --oneline
Used to view commit history in short format.

**Command:**
git log --oneline

## git cherry-pick
Used to apply a specific commit from another branch.

**Command:**
git cherry-pick <commit-hash>

## git checkout
Used to switch between branches or move to a specific commit.

**Command:**
git checkout <branch-name>

This moves `HEAD` to the specified branch.

## git checkout <commit-hash>
Used to move `HEAD` to a specific commit.

**Command:**
git checkout <commit-hash>

This results in a detached HEAD state.

## git reset
Used to move the current branch pointer to a specified commit.

**Command:**
git reset <commit-hash>

This does not create a new commit.


## git reset --soft
Moves `HEAD` to the specified commit but keeps changes staged.

**Command:**
git reset --soft <commit-hash>

## git reset --mixed
Moves `HEAD` to the specified commit and unstages changes.

**Command:**
git reset --mixed <commit-hash>

This is the default behavior of `git reset`.

## git reset --hard
Moves `HEAD` to the specified commit and discards all changes.

**Command:**
git reset --hard <commit-hash>

This permanently removes uncommitted changes.

## git revert
Used to undo a commit by creating a new commit.

**Command:**
git revert <commit-hash>

This does not remove commit history.

## git restore
Used to restore files in the working directory or staging area.

**Command:**
git restore <file-name>

## git restore --staged
Used to unstage a file.

**Command:**
git restore --staged <file-name>


## git rebase
Used to reapply commits on top of another base commit.

**Command:**
git rebase <branch-name>

This moves commits to a new base.


## git rebase --continue
Used to continue rebase after resolving conflicts.

**Command:**
git rebase --continue

## git rebase --abort
Used to cancel an ongoing rebase operation.

**Command:**
git rebase --abort

## git rebase --skip
Used to skip the current commit during rebase.

**Command:**
git rebase --skip


## git pull --rebase
Used to fetch changes and reapply local commits on top of the fetched branch.

**Command:**
git pull --rebase

## git push
Used to upload local commits to the remote repository.

**Command:**
git push

This pushes changes from the current local branch to its linked remote branch.

## git push origin <branch-name>
Used to push a specific branch to the remote repository.

**Command:**
git push origin <branch-name>

`origin` refers to the default remote repository.

## git push -u origin <branch-name>
Used to push a branch and set the upstream tracking branch.

**Command:** 
git push -u origin <branch-name>

After setting upstream, future `git push` commands can be run without specifying the branch name.

## git push --set-upstream origin <branch-name>
Used to set the upstream branch explicitly.

**Command:**
git push --set-upstream origin <branch-name>

This is equivalent to `git push -u`.

## git push --all
Used to push all local branches to the remote repository.

**Command:**
git push --all

## git push --tags
Used to push all local tags to the remote repository.

**Command:**
git push --tags


## git push origin --delete <branch-name>
Used to delete a branch from the remote repository.

**Command:**
git push origin --delete <branch-name>

## git push --force
Used to forcefully push changes to the remote repository.

**Command:**
git push --force

This overwrites remote history.

## git push --dry-run
Used to preview what will be pushed without actually pushing.

**Command:**
git push --dry-run

The solution for sync-up question:
I was asked to create a branch from Day1 branch and name it as Day1-test
and modify the file and merge it 

PS C:\Users\logupriya.a\devops_logupriyaa> **git add Week1/Day1/sample.c**
PS C:\Users\logupriya.a\devops_logupriyaa> **git status**                
On branch Day1-testt
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   Week1/Day1/sample.c

PS C:\Users\logupriya.a\devops_logupriyaa> **git commit -m "test"**
[Day1-testt 82a1dd7] test
 1 file changed, 1 insertion(+)
PS C:\Users\logupriya.a\devops_logupriyaa> **git push origin Day1-testt**
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 8 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (5/5), 385 bytes | 128.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
remote: 
remote: Create pull request for Day1-testt:
remote:   https://bitbucket.org/devops_priya1/devops_logupriyaa/pull-requests/new?source=Day1-testt&t=1
remote:
To https://bitbucket.org/devops_priya1/devops_logupriyaa.git
 * [new branch]      Day1-testt -> Day1-testt
PS C:\Users\logupriya.a\devops_logupriyaa> **git checkout Day1**         
Switched to branch 'Day1'
Your branch is up to date with 'origin/Day1'.
PS C:\Users\logupriya.a\devops_logupriyaa> **git merge Day1-testt**    
Updating 959f09f..82a1dd7
Fast-forward
 Week1/Day1/sample.c | 1 +
 1 file changed, 1 insertion(+)

 worked on it practically