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

 1. git status - used to see conflicted files 
 2. git diff - used to see conflict changes 
 3. git merge --abort - cancels the merge
 4. git checkout --theirs files - keeps the merge from other branch 
 5. git checkout --ours file - keeps the changes from current branch