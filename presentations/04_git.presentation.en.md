# Version Control and Collaboration

## Slide 0. Version Control and Collaboration

```slide:title
+----------------------------------------------------------------+
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|               Version Control and Collaboration                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
|                                                                |
|                                                  [Author Name] |
|                                 Automation and Scripting, 2026 |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Welcome to today's lesson on Version Control and Collaboration. We will look at Git, the de facto standard among distributed version control systems: its core concepts, essential commands, typical working scenarios, code review, and how Git drives automation and CI/CD pipelines.

## Slide 1. Section: Version Control

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                    Version Control                     |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |        Managing change in a distributed world.         |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ We start with the foundations: what version control is, why Git became the standard, and which concepts and commands you need to understand before anything else.

## Slide 2. What Is Version Control?

```slide:content
+----------------------------------------------------------------+
| What Is Version Control?                                       |
|                                                                |
+----------------------------------------------------------------+
| Version control: a system for managing changes in files        |
| - Coordinates work between project participants                |
| - Git: de facto standard distributed VCS                       |
| - Reliable and fast                                            |
|                                                                |
| Hosting platforms (cloud repositories, team tools)             |
| - GitHub, GitLab, Bitbucket                                    |
|                                                                |
| GUI clients and IDE integration                                |
| - Sourcetree, GitKraken, built-in IDE support                  |
+----------------------------------------------------------------+
```

__Comment:__ Version control is a system for managing changes in files and for coordinating the work of project participants. Git is the de facto standard among distributed systems thanks to its reliability and performance. Platforms such as GitHub, GitLab and Bitbucket extend Git with cloud hosting and tools for team development. Modern IDEs integrate Git, and specialized GUI clients like Sourcetree or GitKraken help those who prefer visual tools to the command line.

## Slide 3. Why Git?

```slide:content
+----------------------------------------------------------------+
| Why Git?                                                       |
|                                                                |
+----------------------------------------------------------------+
| Created in 2005 to manage Linux kernel development             |
| (high performance and reliability were required)               |
|                                                                |
| Key strengths                                                  |
| - Distributed architecture (every clone is a full copy)        |
| - High performance (most operations are local)                 |
| - Flexible branching (branches are cheap)                      |
|                                                                |
| Result: an industry standard for projects of any scale         |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Git appeared in 2005 as a solution for the Linux kernel project, which needed high performance and reliability. Three properties made it a universal tool. First, the distributed architecture: every developer holds a complete copy of the repository, so there is no single point of failure. Second, performance: most operations are local and need no network. Third, flexible branching: a branch is only a lightweight pointer, so creating one costs almost nothing.

## Slide 4. Git Architecture: DAG

```slide:content
+----------------------------------------------------------------+
| Git Architecture: DAG                                          |
|                                                                |
+----------------------------------------------------------------+
| Commits form a Directed Acyclic Graph (DAG)                    |
|                                                                |
|  [Initial] --> [Feature A] --> [A update] --+                  |
|      |                                      v                  |
|      |                                  [ Merge ] --> [ Main ] |
|      |                                      ^                  |
|      +-----> [Feature B] --> [B update] ----+                  |
|                                                                |
| Each commit references its parent; branches are pointers       |
| Merging integrates branches and keeps full history             |
+----------------------------------------------------------------+
```

__Comment:__ Git architecture is a Directed Acyclic Graph. Each commit is an immutable snapshot of the project and references its parent, forming a chain of history. A branch is just a lightweight pointer to a commit, so we can create parallel lines of development without touching the main code. In the diagram, two features start from the initial commit, each gets an update, and both are then merged into main. Merging keeps the complete history and makes the development process transparent.

## Slide 5. Core Git Concepts (1/2)

```slide:content
+----------------------------------------------------------------+
| Core Git Concepts (1/2)                                        |
|                                                                |
+----------------------------------------------------------------+
| Structural Elements                                            |
| - Repository: project files, metadata, full history            |
| - Commit: atomic snapshot with unique SHA-1 hash               |
| - Branch: independent line of development                      |
|                                                                |
| Change Management                                              |
| - Merge: integrate changes from different branches             |
| - Conflict: ambiguous automatic merge, fix it manually         |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ A repository stores the project files, metadata and the complete change history. A commit is an atomic snapshot of the project state identified by a unique cryptographic hash. A branch is an independent line of development that allows parallel work on different features. Merging integrates changes from different branches while preserving history. When Git cannot merge automatically, it reports a conflict that must be resolved by hand.

## Slide 6. Core Git Concepts (2/2)

```slide:content
+----------------------------------------------------------------+
| Core Git Concepts (2/2)                                        |
|                                                                |
+----------------------------------------------------------------+
| Collaborative Operations                                       |
| - Remote: shared repository on a server                        |
| - Clone: full local copy of a remote repository                |
| - Pull: bring remote changes into the local repository         |
| - Push: publish local changes to the remote                    |
|                                                                |
| Typical cycle                                                  |
| clone  ->  commit  ->  pull  ->  push                          |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ A remote repository lives on a server and is used to synchronize work between participants. Clone creates a complete local copy of it. Pull synchronizes your local repository with remote changes, and push publishes your local commits. A typical working cycle is: clone once, commit locally, pull to get the others' changes, and push your own.

## Slide 7. Essential Git Commands (1/3)

```slide:content
+----------------------------------------------------------------+
| Essential Git Commands (1/3)                                   |
|                                                                |
+----------------------------------------------------------------+
| Initialization & Configuration                                 |
| - git init                Initialize new local repository      |
| - git clone <url>         Clone remote repository              |
| - git config              Configure Git parameters             |
|                                                                |
| Change Management                                              |
| - git status              Analyze working directory state      |
| - git add <file>          Stage files for commit               |
| - git commit -m "msg"     Record changes with a message        |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ These commands are used daily. git init creates a new local repository, git clone copies an existing remote one, and git config sets your parameters. For change management, git status shows the state of the working directory, git add stages files for the next commit, and git commit records the staged changes with a descriptive message.

## Slide 8. Essential Git Commands (2/3)

```slide:content
+----------------------------------------------------------------+
| Essential Git Commands (2/3)                                   |
|                                                                |
+----------------------------------------------------------------+
| Branch Operations                                              |
| - git branch              View, create, delete branches        |
| - git switch <branch>     Switch branches (modern, Git 2.23+)  |
| - git checkout <branch>   Switch branches (classic)            |
| - git merge <branch>      Integrate changes from a branch      |
|                                                                |
| Viewing History                                                |
| - git log                 View commit history with details     |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ git branch manages branches: view, create and delete. To switch between them, use git switch, the modern recommended command since Git 2.23, or the classic and universal git checkout. git merge integrates changes from another branch into the current one. Finally, git log shows the commit history with details.

## Slide 9. Essential Git Commands (3/3)

```slide:content
+----------------------------------------------------------------+
| Essential Git Commands (3/3)                                   |
|                                                                |
+----------------------------------------------------------------+
| Remote Repository Synchronization                              |
| - git remote              Manage remote repositories           |
| - git fetch               Get updates without merging          |
| - git pull                Get and automatically merge changes  |
| - git push                Publish local changes to remote      |
|                                                                |
| Tips                                                           |
| - fetch lets you review changes before merging                 |
| - pull = fetch + merge in one step                             |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Remote synchronization is crucial for teamwork. git remote manages connections to remote repositories. git fetch downloads updates without merging them, which gives you a chance to review first. git pull downloads and integrates the changes in one step, so it is equivalent to fetch followed by merge. git push publishes your local changes to the remote repository.

## Slide 10. Section: Common Git Usage Scenarios

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |               Common Git Usage Scenarios               |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |          From first commit to clean history.           |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Now we apply the commands in typical scenarios: configuring Git, creating a repository, developing features, resolving conflicts, viewing history, undoing changes, configuring a repository, rebasing, and stashing.

## Slide 11. Scenario: Git Setup

```slide:content
+----------------------------------------------------------------+
| Scenario: Git Setup                                            |
|                                                                |
+----------------------------------------------------------------+
| Mandatory first step: identify the author of commits           |
|                                                                |
| git config --global user.name "User Name"                      |
| git config --global user.email "email@example.com"             |
|                                                                |
| Optional: set the default branch name                          |
| git config --global init.defaultBranch main                    |
|                                                                |
| Check your settings                                            |
| git config --list                                              |
+----------------------------------------------------------------+
```

__Comment:__ Initial configuration is a mandatory step. Before the first commit, set the user name and e-mail address, because they are attached to every commit you create. The global flag applies the settings to all repositories on your machine. Optionally, set the default branch name to main so that new repositories start with it. You can always check the result with git config --list.

## Slide 12. Scenario: Repository Creation

```slide:content
+----------------------------------------------------------------+
| Scenario: Repository Creation                                  |
|                                                                |
+----------------------------------------------------------------+
| Create a project with a main branch and a remote               |
|                                                                |
| git init my_project                                            |
| cd my_project                                                  |
| git checkout -b main        # create main branch               |
| echo "# My Project" > README.md                                |
| git add .                                                      |
| git commit -m "Initial commit"                                 |
| git remote add origin <url> # link remote                      |
| git push -u origin main     # -u: set upstream                 |
+----------------------------------------------------------------+
```

__Comment:__ Creating a repository includes three parts: initializing it, creating the base branch, and linking it to a remote repository. Initialize the project, create the main branch, add a first file such as README.md, and make the first commit. Then link a remote repository on GitHub, GitLab or Bitbucket and push. The -u flag sets up upstream tracking, so later pushes and pulls know where to go.

## Slide 13. Scenario: Implementing New Features

```slide:content
+----------------------------------------------------------------+
| Scenario: Implementing New Features                            |
|                                                                |
+----------------------------------------------------------------+
| Protect main: all changes go through feature branches          |
|                                                                |
| git checkout main                                              |
| git pull origin main        # get latest changes               |
| git checkout -b feature-branch# or: git switch -c              |
| git add .                                                      |
| git commit -m "Add new feature"                                |
| git push origin feature-branch                                 |
|                                                                |
| Then open a Pull Request on GitHub / GitLab                    |
+----------------------------------------------------------------+
```

__Comment:__ Standard Git practice protects the base branch, for example main, from direct changes. Start from an up-to-date main, create a separate branch for the new functionality, and make your commits there. Push the branch to the remote and open a pull request in the platform interface. The pull request is where discussion, review and automated checks happen before the changes reach main.

## Slide 14. Scenario: Conflict Resolution

```slide:two-columns
+----------------------------------------------------------------+
| Scenario: Conflict Resolution                                  |
|                                                                |
+-----------------------------+----------------------------------+
| When conflicts occur        | Resolution steps                 |
|                             |                                  |
| - Same lines changed in     | 1. git status (find files)       |
|   different branches        | 2. Open files, find markers      |
| - Git cannot merge          |    <<<<<<<  =======  >>>>>>>     |
|   automatically             | 3. Keep the needed code          |
| - Merge pauses and files    | 4. git add <file>                |
|   get conflict markers      | 5. git commit (finish merge)     |
|                             | 6. git push                      |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ Merge conflicts occur when changes in different branches touch the same code sections. This is natural in collaborative development. Git pauses the merge and marks the problematic files with the markers shown on the slide. Resolving a conflict is a manual decision: keep one version, combine them, or rewrite the fragment. Then remove the markers, stage the file, commit to complete the merge, and push. For complex conflicts, talk to the author of the other change.

## Slide 15. Scenario: Viewing Change History

```slide:content
+----------------------------------------------------------------+
| Scenario: Viewing Change History                               |
|                                                                |
+----------------------------------------------------------------+
| Commit history                                                 |
| - git log                 Full history with details            |
| - git log --oneline       One line per commit                  |
| - git log --graph --onelineBranch graph                        |
| - git log --since="2 weeks"Filter by date                      |
| - git log --author="name" Filter by author                     |
|                                                                |
| Changes in a file                                              |
| - git diff <file>         Unstaged changes in the file         |
| - git log -- <file>       History of a single file             |
+----------------------------------------------------------------+
```

__Comment:__ git log lists the commits of the current branch; each has a unique hash, an author, a date and a message. Options change the output: --oneline gives a compact view, --graph draws the branches, and --since and --author filter the list. To inspect a specific file, git diff shows its changes that are not staged yet, while git log with the file name shows only the commits that touched it. Use git diff --staged to see staged changes.

## Slide 16. Scenario: Undoing Changes

```slide:two-columns
+----------------------------------------------------------------+
| Scenario: Undoing Changes                                      |
|                                                                |
+-----------------------------+----------------------------------+
| Not committed yet           | Already committed                |
|                             |                                  |
| git restore <file>          | git revert HEAD                  |
|   undo working dir changes  |   new commit undoing the last    |
|                             |                                  |
| git restore --staged <file> | git revert <commit-hash>         |
|   unstage (undo in index)   |   undo a specific commit         |
|                             |   (history is preserved)         |
|                             |                                  |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ How to undo depends on whether the changes are committed. For uncommitted changes, use git restore: it discards changes in the working directory, and with --staged it removes a file from the staging area. For committed changes, git revert is the safe choice: it creates a new commit that undoes the earlier one and keeps the history intact.

## Slide 17. Undoing with git reset

```slide:content
+----------------------------------------------------------------+
| Undoing with git reset                                         |
|                                                                |
+----------------------------------------------------------------+
| git reset moves the branch pointer to an earlier commit        |
|                                                                |
| git reset --hard HEAD~1     # DANGER: data loss!               |
|   also deletes all uncommitted changes                         |
| git reset --soft HEAD~1     # keep changes staged              |
| git reset --mixed HEAD~1    # keep changes in working dir      |
|                                                                |
| Use extremely carefully; on shared branches                    |
| prefer git revert                                              |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ git reset moves the branch pointer back to a previous commit, and it can lead to irreversible data loss, so use it extremely carefully. The hard option deletes all uncommitted changes together with the commit. The safer alternatives keep your work: soft leaves the changes in the staging area, and mixed, which is also the default, leaves them in the working directory. On shared branches prefer git revert, because reset rewrites history.

## Slide 18. Repository Configuration

```slide:content
+----------------------------------------------------------------+
| Repository Configuration                                       |
|                                                                |
+----------------------------------------------------------------+
| Configuration files define Git behavior                        |
|                                                                |
| - .gitignore: files and folders excluded from tracking         |
| - .gitattributes: line endings, encoding, merge strategies     |
| - README.md: project description, installation, usage          |
| - LICENSE: terms of code usage                                 |
|                                                                |
| The most critical one: .gitignore                              |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Repository configuration means creating files that define Git behavior and make project work convenient. The most critical one is .gitignore, which lists files and directories excluded from tracking. Other useful files are .gitattributes for line endings, encoding and merge strategies, README.md with the project description and usage instructions, and LICENSE with the license of the code.

## Slide 19. .gitignore Essentials

```slide:content
+----------------------------------------------------------------+
| .gitignore Essentials                                          |
|                                                                |
+----------------------------------------------------------------+
| # Compiled files                                               |
| *.class  *.o  *.pyc  __pycache__/                              |
| # Build files and dependencies                                 |
| build/  dist/  target/  node_modules/                          |
| # Confidential data                                            |
| .env  *.key  *.pem  config/secrets/                            |
| # IDEs and editors                                             |
| .vscode/  .idea/  *.swp  *.swo                                 |
| # Logs, temporary and system files                             |
| *.log  *.tmp  *.temp  .DS_Store  Thumbs.db                     |
+----------------------------------------------------------------+
```

__Comment:__ A well-crafted .gitignore is essential. Exclude compiled files for your languages, build outputs and dependency directories such as node_modules, files with confidential data, IDE folders, and logs, temporary and operating-system files. Most importantly, never commit secrets: environment files, private keys, certificates and secret configuration. Remember that ignoring a file does not remove it from the history if it was already committed.

## Slide 20. Rebasing

```slide:content
+----------------------------------------------------------------+
| Rebasing                                                       |
|                                                                |
+----------------------------------------------------------------+
| Rewrites history to make it linear and clean                   |
| - Easier to follow the sequence of changes                     |
|                                                                |
| git rebase main             # replay branch onto main          |
| git rebase -i HEAD~3        # edit the last 3 commits          |
|                                                                |
| Interactive actions: pick, squash, reword, drop                |
|                                                                |
| Be careful with shared branches &                              |
| history rewrites: risk of conflicts, data loss                 |
+----------------------------------------------------------------+
```

__Comment:__ Rebase replays the commits of your branch on top of another base, creating a linear and clean history, which simplifies reading and navigating the project history. Interactive rebase lets you pick, squash, reword or drop commits, which is useful for cleaning up before a pull request. But rebase rewrites history, so be careful with shared branches: if others have based their work on the original commits, you can cause conflicts and data loss. Rebase only local, unpublished work.

## Slide 21. Stashing

```slide:content
+----------------------------------------------------------------+
| Stashing                                                       |
|                                                                |
+----------------------------------------------------------------+
| Temporarily saves unfinished changes                           |
| git stash                   # save current changes             |
| git stash list              # view the stash list              |
| git stash pop               # restore latest, remove it        |
| git stash apply             # restore latest, keep it          |
| git stash push -m "msg"     # save with a message              |
|                                                                |
| Use cases                                                      |
| - Switch branches mid-work without committing                  |
| - Pull latest changes before continuing                        |
+----------------------------------------------------------------+
```

__Comment:__ Stash lets you temporarily put aside unfinished changes without committing them. git stash saves the changes and gives you a clean working directory, git stash list shows the saved entries, and git stash pop restores the latest one and removes it from the list. git stash apply restores it but keeps it in the list, and push with -m lets you add a descriptive message. Note that stashes are local only, and untracked files are not included unless you use the -u option.

## Slide 22. Section: Code Review Processes

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                 Code Review Processes                  |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |             Where quality meets learning.              |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Next, code review: the systematic process of checking changes by other developers before they are integrated into the main branch.

## Slide 23. What Is Code Review?

```slide:content
+----------------------------------------------------------------+
| What Is Code Review?                                           |
|                                                                |
+----------------------------------------------------------------+
| Systematic check of code changes by other developers           |
| before they are merged into the main branch                    |
|                                                                |
| Benefits                                                       |
| - Better quality: finds errors and vulnerabilities             |
| - Knowledge sharing between team members                       |
| - Adherence to coding standards and architecture               |
| - Collective responsibility for product quality                |
|                                                                |
| Tools: GitHub, GitLab, Bitbucket, Crucible, Review Board       |
+----------------------------------------------------------------+
```

__Comment:__ Code review is a critically important element of software quality assurance. It improves quality by finding potential errors and vulnerabilities, spreads knowledge between team members, helps keep to coding standards and architectural principles, and builds collective responsibility for the product. It is supported by tools integrated into platforms such as GitHub, GitLab and Bitbucket, or by specialized systems such as Crucible and Review Board.

## Slide 24. Code Review Workflow (1/2)

```slide:content
+----------------------------------------------------------------+
| Code Review Workflow (1/2)                                     |
|                                                                |
+----------------------------------------------------------------+
| 1. Planning: define the task, create a feature branch          |
| 2. Development: implement with regular commits                 |
| 3. Preliminary testing: verify locally                         |
| 4. Publishing: push the branch to the remote                   |
| 5. Pull Request: create it with a change description           |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ A typical process with code review has nine stages. First, planning: define the task and create a feature branch. Then development with regular commits, and preliminary local testing. After that, publish the branch to the remote repository and create a pull request with a clear description of the changes.

## Slide 25. Code Review Workflow (2/2)

```slide:content
+----------------------------------------------------------------+
| Code Review Workflow (2/2)                                     |
|                                                                |
+----------------------------------------------------------------+
| 6. Automated checks: CI/CD pipeline, static analysis           |
| 7. Manual review: code, architecture, discussion               |
| 8. Iterations: address feedback, re-review                     |
| 9. Approval and merge: integrate into main branch              |
|                                                                |
| Review tools provide                                           |
| - Convenient discussion of changes                             |
| - Comment tracking                                             |
| - Management of the review process                             |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Once the pull request exists, automated checks run first: the CI/CD pipeline and static analysis catch basic issues. Then reviewers examine the code and the architecture and discuss the changes. The author addresses feedback and the changes are reviewed again, as many times as needed. After approval, the branch is merged into main. Review tools give convenient interfaces for discussing changes, tracking comments and managing this process.

## Slide 26. Section: Using Git for Automation Scripts

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |            Using Git for Automation Scripts            |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |            Git events trigger the pipeline.            |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Git is not only a code management tool. In modern development it is the foundation of DevOps processes and a trigger for automation.

## Slide 27. Git as an Automation Trigger

```slide:content
+----------------------------------------------------------------+
| Git as an Automation Trigger                                   |
|                                                                |
+----------------------------------------------------------------+
| Git: the foundation of DevOps automation                       |
| Not only code storage, but a trigger mechanism                 |
|                                                                |
| CI/CD pipeline areas                                           |
| - Continuous Integration: build, test, analyze each commit     |
| - Automated Deployment: to environments on repo events         |
| - Release Management: releases, version tags, docs             |
| - Quality Monitoring: code analysis, metrics tracking          |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Integration with CI/CD systems lets us build complex automation pipelines. Continuous integration automatically builds, tests and analyzes code with each commit. Automated deployment publishes to various environments based on repository events. Release management creates releases, tags versions and generates documentation. Quality monitoring connects the repository with code analysis systems and metrics tracking.

## Slide 28. Git Events as Integration Points

```slide:two-columns
+----------------------------------------------------------------+
| Git Events as Integration Points                               |
|                                                                |
+-----------------------------+----------------------------------+
| Git events                  | Automated workflows              |
|                             |                                  |
| - Commit / push to a branch | - Build, test, static analysis   |
| - Pull request opened       | - Deploy to environments         |
|   or updated                | - Create releases, version tags  |
| - Tag created (v1.0.0)      | - Generate documentation         |
|                             | - Track quality metrics          |
|                             |                                  |
|                             |                                  |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ Git events such as commits, pull requests and tags serve as integration points that launch automated workflows. A push to a feature branch can trigger a build and tests, a pull request can trigger the full verification, and a version tag can trigger a release. This gives a seamless connection between development and operations, and traceability from every code change to its deployment.

## Slide 29. Large Repositories

```slide:content
+----------------------------------------------------------------+
| Large Repositories                                             |
|                                                                |
+----------------------------------------------------------------+
| Optimization for large repositories                            |
|                                                                |
| - Git LFS: large files (media, binaries)                       |
| - Partial clone: only the necessary parts                      |
| - Shallow clone: limited history depth                         |
|                                                                |
| git clone --depth 1 <repository-url>                           |
| git clone --filter=blob:limit=1m <repository-url>              |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Large repositories need special handling. Git LFS, Large File Storage, handles large files such as media and binaries. A shallow clone with --depth 1 fetches only the latest history, which is ideal for fast CI jobs. A partial clone with --filter downloads only the necessary parts of the repository; here, blobs above the given size limit are not downloaded up front.

## Slide 30. Performance Monitoring

```slide:content
+----------------------------------------------------------------+
| Performance Monitoring                                         |
|                                                                |
+----------------------------------------------------------------+
| Repository statistics                                          |
| git count-objects -vH                                          |
|                                                                |
| File size analysis                                             |
| git ls-tree -r -t -l --abbrev HEAD | sort -n -k 4              |
|                                                                |
| Repository optimization                                        |
| git gc --aggressive --prune=now                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Three commands help to monitor and maintain a repository. git count-objects shows repository statistics. The git ls-tree command, sorted by size, helps to find the biggest files, which are candidates for Git LFS. git gc with the aggressive option optimizes the repository, but it is resource-intensive, so run it occasionally rather than routinely.

## Slide 31. Bibliography

```slide:content
+----------------------------------------------------------------+
| Bibliography                                                   |
|                                                                |
+----------------------------------------------------------------+
| 1. Chacon S., Straub B. Pro Git Book, 2nd ed., Apress, 2014    |
|    https://git-scm.com/book/en/v2                              |
|                                                                |
| 2. Git Documentation                                           |
|    https://git-scm.com/doc                                     |
|                                                                |
| 3. Braganza A. Looks Good To Me!, Manning, 2024                |
|    https://www.manning.com/books/looks-good-to-me              |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ These sources cover everything in this lesson. Pro Git is the standard free reference book, the official documentation describes every command, and Looks Good To Me! is a practical book on code review.

## Slide 32. Thank You / Questions?

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                       Thank You                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                       Questions?                       |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Thank you for your attention. We covered Git concepts and commands, typical scenarios from setup to rebasing and stashing, code review, and the role of Git in automation. I am happy to answer your questions.