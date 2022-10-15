##How Git Works##
#version management
#working directory:all files which a part of this folder and which are supposed to be managed by git
#commit: a snapshot. By adding another commit, you can add the changes based on the inital state
#Hence,use Git is about tracking changes, but not about storing files again and again
#How does Git store these different changes still?-->Branches
#By default, git stores all commit we make in main branch

##Working Directory and Repository##
#Repository:.git(hidden), the places to realize version management, including Staging Area(Index File) and Commits(Object Folder)
#The staging area is a draft area. All Changes→Staging Area→Commits

##Understanding Branches##
#Master/Main branch: all different versions(entire history) of your project that you had. You can always jump back to previous versions.
#Establish Another Branch: A entire copy of current state and previous commits of the master branch, but we can now work independently from the main branch without affects on the actual running version. After done the editing, we can add back these new changes back to the master branch(Merge).It is a sub-folder inside the git project.

##Intall Git##
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew install git
git --version                                

##Initial the Repository&Creating the first commit##
➜  Git git:(main) ✗ git --version
#return:git version 2.37.0 (Apple Git-136)
git init                               #initialize the repository
git status
#Return:
#On branch main
#No commits yet
#Untracked files:                      #This part is not in the staging area
  #(use "git add <file>..." to include in what will be committed)
        #InitialCommit.txt
        #Introduction to Git.sh
        #MacTerminal_Basic.sh
#nothing added to commit but untracked files present (use "git add" to track)
git add .                              #Add all files in the Git folder,status will show: changes to be commited added into the staging area
git add fileName                       #add the specific file
git commit -m "add first git commit"   #-m stands for message to make clear what exactly changed with this commit
git config --global user.email "DorisWang@example.com"
git config --global user.name "Your Name"
git log                                 #List commits that are reachable
#return:
#commit 80516316a562d7652581a5ea02906a0af4f2c8d3 (HEAD -> main) #the unique ID for each commit we create
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 16:31:55 2022 +0800
    #add first git commit
git add SecondCommit.txt                 #if we add another file in the commit area
git commit -m "added second commit file"
git log                                  #if we want to go back to another version of doucment, we just need to type the unique commit ID.But the latest one is not deleted, it still exists.
#return:
#commit 176c91cca88c367a70d5a301eaa418dec5a4bd7f (HEAD -> main)
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 17:04:09 2022 +0800

    #added second commit file

#commit 80516316a562d7652581a5ea02906a0af4f2c8d3
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 16:31:55 2022 +0800

    #add first git commit
git checkout specificID                  #EG:git checkout 80516316a562d7652581a5ea02906a0af4f2c8d3, go back to this version files
#Return:
#M       Introduction to Git.sh
#Note: switching to '80516316a562d7652581a5ea02906a0af4f2c8d3'.
git checkout main 
git log                                  #these two steps will give all the commits we made before              

##Create and Understand Branches##
git branch                               #look at all the branches we have
git branch newBranchName                 #add the new branch, the branch name can not exists any spaces eg:git branch second-branch
git checkout second-branch               #switch to the new specific branch we created
#return:
#M       Introduction to Git.sh
#Switched to branch 'second-branch'

git log                                  #to check the structure of the branches we created, the two are in the same level,and share the same commit
#return:
#commit 176c91cca88c367a70d5a301eaa418dec5a4bd7f (HEAD -> second-branch, main)
git checkout -b third-branch               #another way to create a new branch: git checkout -b newBranchName. And switch to the new branch automatically
git add Working-with-branches.txt
git commit -m "added branches text file"  
git checkout main                          #switch to the main branch and only care about main related files
git log                                    #we can see the third branch has been disappeared
#return:
#commit 176c91cca88c367a70d5a301eaa418dec5a4bd7f (HEAD -> main, second-branch)
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 17:04:09 2022 +0800
    #added second commit file
#commit 80516316a562d7652581a5ea02906a0af4f2c8d3
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 16:31:55 2022 +0800
    #added first git commit

##Merging Branches--The Basic##
git merge third-branch                     #here the position should be at the main branch, using git merge branchName command
#return:
#Updating 176c91c..8203851
#Fast-forward
 #Working-with-branches.txt | 1 +
 #1 file changed, 1 insertion(+)
 #create mode 100644 Working-with-branches.txt
git log 
#return:
#commit 8203851b5c8d1d746272e0844080c0af38b678a2 (HEAD -> main, third-branch)
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 18:09:05 2022 +0800
    #added branches text file
#commit 176c91cca88c367a70d5a301eaa418dec5a4bd7f (second-branch)
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 17:04:09 2022 +0800
    #added second commit file
#commit 80516316a562d7652581a5ea02906a0af4f2c8d3
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 16:31:55 2022 +0800
    #add first git commit

##Understanding Head##
#Head: when checkout the branch, it indirectly refers to the lastest commit in this branch by default.
git checkout second-branch
git log
#return:
#commit 176c91cca88c367a70d5a301eaa418dec5a4bd7f (HEAD -> second-branch)
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 17:04:09 2022 +0800
    #added second commit file
#commit 80516316a562d7652581a5ea02906a0af4f2c8d3
#Author: QiutingWang <118020390@link.cuhk.edu.cn>
#Date:   Sat Oct 15 16:31:55 2022 +0800
    #add first git commit

##The Detached Head##
#Detached Head: in the middle of the branches, and not related to a specific branch
git checkout 176c91cca88c367a70d5a301eaa418dec5a4bd7f  #use the second-branch specific commit ID
#return:
#M       Introduction to Git.sh
#Note: switching to '176c91cca88c367a70d5a301eaa418dec5a4bd7f'.
#You are in 'detached HEAD' state. You can look around, make experimental changes and commit them, and you can discard any commits you make in this state without impacting any branches by switching back to a branch.
git branch                             #check out its position. The result shows it doesn't belongs to any specific branch
#* (HEAD detached at 176c91c)
  #main
  #second-branch
  #third-branch

##Branches and git switch##
git switch third-branch              #switch to the existing branch
git switch -c fourth-branch           #use git swith -c newBranchName to create a new branch and switch to it

##Deleting Data##
#Deleting in working directory files/unstaged changes/staged changes/latest commit/branches
##Delect Working Directory Files##
git checkout main
git ls-files                       #check the files in which stage
#return:
#InitialCommit.txt
#Introduction to Git.sh
#MacTerminal_Basic.sh
#SecondCommit.txt
#Working-with-branches.txt
git rm Working-with-branches.txt   #remove the specific working directory file
git ls-files
#return:
#InitialCommit.txt
#Introduction to Git.sh
#MacTerminal_Basic.sh
#SecondCommit.txt
git commit -m "deleting Working-with-branches file"
#return:
#[main dcec85c] deleting Working-with-branches file
 #1 file changed, 1 deletion(-)
 #delete mode 100644 Working-with-branches.txt

##Undo Unstaged Changes##
git status                         #check out the unstaged change
#return:
#On branch main
#Changes not staged for commit:
  #(use "git add <file>..." to update what will be committed)
  #(use "git restore <file>..." to discard changes in working directory)
        #modified:   InitialCommit.txt
        #modified:   Introduction to Git.sh
git checkout InitialCommit.txt             #undo the changes in the initialcommit file
#Updated 1 path from the index
git checkout ..                            #undo the all commits in all track files in the current branch
git restore InitialCommit.txt              #another way to undo the changes in specific file. also .. is a way to undo all commits in all track files in the current branch
git clean -dn test.txt                     #delete the unstaged file,using git clean -dn fileName, n: list
#return:Would remove test.txt
git clean -df                              #delet it forcely
#return:Removing test.txt

##Undoing Staged Changes##
git add InitialCommit.txt       # add the newest changes in Git,make it a staged change
git status
#return:
#On branch main
#Changes to be committed:
  #(use "git restore --staged <file>..." to unstage)
        #modified:   InitialCommit.txt
git reset InitialCommit.txt   #simply copy the lastest stage of the file into the staging area
git checkout InitialCommit.txt
#return:Updated 1 path from the index

git add SecondCommit.txt      # add the newest changes in Git,make it a staged change
git restore --staged SecondCommit.txt  #another way to undo the staged changes
git checkout SecondCommit.txt
#return:Updated 1 path from the index

##Delect Commits use git reset##
git add Unrequired.txt
git commit -m "Unrequired file added"
git reset --soft HEAD~1   #~n n means how many steps we should go back reset it. The final result shows the lastest commit has gone.Soft:keep the changes in working directory and removing the latest commit 
git commit -m "unrequired file added again"
git reset HEAD~1         #another way to reset go back to the lastest commit
git ls-files             #the result shows now the file is deleted
git reset --hard HEAD~1  #Hard: removing the changes from the working directory and moving the changes to the staging area

##Delecting Branches##
git branch -D fourth-branch  #git branch -d/D branchName. D is force delecting whether you have merge or not. d is only allows to delet the branch you have already merged.
#return:Deleted branch fourth-branch (was 8203851).
#it can delete multiple branches by list the branchnames separate by space