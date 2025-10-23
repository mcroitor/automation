# Questions on "Version Control and Collaboration"

## Knowledge

1. What is Git?
   - [x] Distributed version control system
   - [ ] Centralized version control system
   - [ ] Database management system
   - [ ] Cloud file storage
2. Which command is used to initialize a new Git repository?
   - [x] `git init`
   - [ ] `git create`
   - [ ] `git new`
   - [ ] `git start`
3. What does the `git add` command do?
   - [x] Prepares files for commit (staging)
   - [ ] Creates a new file in the repository
   - [ ] Adds a remote repository
   - [ ] Merges branches
4. Which command is used to create a commit in Git?
   - [x] `git commit -m "message"`
   - [ ] `git save -m "message"`
   - [ ] `git create -m "message"`
   - [ ] `git record -m "message"`
5. What information must be configured during initial Git setup?
   - [x] Username and email
   - [ ] Password and access token
   - [ ] Project path and branch name
   - [ ] Server address and connection port
6. What is the modern recommended command for switching between branches (Git 2.23+)?
   - [x] `git switch`
   - [ ] `git checkout`
   - [ ] `git branch`
   - [ ] `git change`
7. What happens when executing the `git clone` command?
   - [x] Creates a complete local copy of the remote repository
   - [ ] Creates a link to the remote repository
   - [ ] Copies only the latest changes
   - [ ] Creates a new branch in the current repository
8. Which file is used to exclude files from Git tracking?
   - [x] `.gitignore`
   - [ ] `.gitexclude`
   - [ ] `.exclude`
   - [ ] `.ignore`
9. What does SHA-1 hash mean in Git context?
   - [x] Unique commit identifier
   - [ ] Password for repository access
   - [ ] Git version number
   - [ ] File size in bytes
10. Which command shows the current state of the working directory?
    - [x] `git status`
    - [ ] `git info`
    - [ ] `git state`
    - [ ] `git check`
11. What is a merge conflict?
    - [x] Git cannot automatically merge changes from different branches
    - [ ] Error when connecting to remote repository
    - [ ] Git version mismatch on different computers
    - [ ] One developer disagrees with another's changes
12. Which command is used to view commit history?
    - [x] `git log`
    - [ ] `git history`
    - [ ] `git show`
    - [ ] `git list`
13. Command for undoing changes in the working directory?
    - [x] `git restore`
    - [ ] `git undo`
    - [ ] `git unmerge`
    - [ ] `git back`
14. What does the `git fetch` command do?
    - [x] Gets updates from remote repository without automatic merging
    - [ ] Sends changes to remote repository
    - [ ] Creates a new branch
    - [ ] Deletes local changes
15. What is the difference between `git pull` and `git fetch`?
    - [x] `pull` gets changes and automatically merges them, `fetch` only gets
    - [ ] `pull` works with branches, `fetch` with commits
    - [ ] `pull` for large files, `fetch` for small ones
    - [ ] No difference, they are synonyms
16. What is rebase in Git?
    - [x] Rewriting commit history to create a more linear history
    - [ ] Creating a repository backup
    - [ ] Deleting old commits
    - [ ] Merging all branches into one
17. What is `git stash` used for?
    - [x] Temporarily saving unfinished changes
    - [ ] Creating a permanent backup
    - [ ] Deleting unnecessary files
    - [ ] Sending changes to remote repository
18. What is the foundation of Git architecture?
    - [x] Directed Acyclic Graph (DAG)
    - [ ] Relational database
    - [ ] Linear list of changes
    - [ ] Tree directory structure
19. Which command creates a new branch and immediately switches to it?
    - [x] `git checkout -b <branch-name>`
    - [ ] `git branch <branch-name>`
    - [ ] `git switch <branch-name>`
    - [ ] `git branch -s <branch-name>`
20. What is a Pull Request (Merge Request)?
    - [x] Request to merge changes from one branch to another with code review capability
    - [ ] Command to get changes from remote repository
    - [ ] Automatic branch merging during conflicts
    - [ ] Creating a backup before changes
21. For which types of files is Git LFS recommended?
    - [x] Large binary files (media, archives)
    - [ ] Source code text files
    - [ ] Configuration files
    - [ ] Documentation files
22. What does the `git gc` command do?
    - [x] Optimizes repository by removing unnecessary objects
    - [ ] Creates a new commit
    - [ ] Switches to main branch
    - [ ] Shows repository statistics
23. What does the `git diff` command show?
    - [x] Differences between working directory and last commit
    - [ ] List of all files in repository
    - [ ] File change history
    - [ ] Commit statistics by authors
24. What is the `git remote add origin <url>` command used for?
    - [x] Adds a remote repository named origin
    - [ ] Creates a new branch origin
    - [ ] Clones repository to origin folder
    - [ ] Sets origin as current branch
25. Which command adds a file to Git tracking?
    - [x] `git add <filename>`
    - [ ] `git track <filename>`
    - [ ] `git watch <filename>`
    - [ ] `git follow <filename>`

## Understanding

1. How to initialize a repository `MyProject`?
   - `git init MyProject`
2. How to add all changed files to tracking?
   - `git add .`
   - `git add *`
3. How to add file `login.js` to tracking?
   - `git add login.js`
4. How to create a commit with message "Initial commit"?
   - `git commit -m "Initial commit"`
5. How to create a new branch `feature-login` and switch to it?
   - `git checkout -b feature-login`
   - `git switch -c feature-login`
6. How to view commit history in short format?
   - `git log --oneline`
7. How to undo changes in file `config.txt` in working directory?
   - `git restore config.txt`
   - `git checkout -- config.txt`
8. How to add a remote repository named `upstream` with URL `<url>`?
   - `git remote add upstream <url>`
9. How to fetch changes from remote branch `main` without merging?
   - `git fetch origin main`
   - `git fetch`
10. How to get all changes from remote repository and merge immediately?
    - `git pull`
11. How to push local commits to remote repository?
    - `git push`
12. How to view repository status?
    - `git status`
13. How to view current branch?
    - `git branch --show-current`
    - `git branch`
14. How to delete local branch `feature-old`?
    - `git branch -d feature-old`
15. How to view differences between working directory and last commit?
    - `git diff`