# Questions on "Advanced Automation Techniques"

1. What main software development processes can be automated?
   - [x] Workplace setup, build, deployment and testing
   - [ ] Code writing, build and compilation
   - [ ] Task complexity assessment, testing and monitoring
   - [ ] Version control, documentation and code review
2. What is Web API in the context of automation?
   - [x] A mechanism for integrating disparate services into a unified ecosystem
   - [ ] A program for creating websites
   - [ ] A database for web applications
   - [ ] A tool for script development
3. What does each field mean in the crontab format `* * * * * command`?
   - [x] minute hour day_of_month month day_of_week command
   - [ ] second minute hour day month command
   - [ ] hour minute day month year command
   - [ ] minute hour month day_of_month day_of_week command
4. Which command is used to edit the current user's crontab?
   - [x] `crontab -e`
   - [ ] `cron -e`
   - [ ] `edit crontab`
   - [ ] `nano /etc/crontab`
5. What does the crontab entry `0 2 * * * /home/user/backup.sh` mean?
   - [x] Execute every day at 2:00 AM
   - [ ] Execute every 2 minutes
   - [ ] Execute 2 times per day
   - [ ] Execute every second day
6. What data is recommended to include in logs to simplify analysis?
   - [x] Timestamp, severity level, message, process identifier, metadata
   - [ ] Error message, user login, password (if applicable)
   - [ ] Timestamp, process identifier, commit identifier
   - [ ] Severity level, hostname, code analyzer result
7. What approaches are used for effective error handling in automation?
   - [x] Error logging, notifications, retry attempts, fallbacks
   - [ ] Error logging, user interaction, retry attempts
   - [ ] Notifications, retry attempts, error ignoring
   - [ ] Fallbacks, error ignoring
8. When should Python be used instead of Bash for automation?
   - [x] When working with complex data structures (JSON, XML), network requests, exception handling
   - [ ] Always use only Bash
   - [ ] For web development, testing and monitoring
   - [ ] Never use Python
9. Which Python module is used for copying files?
   - [x] `shutil`
   - [ ] `os`
   - [ ] `sys`
   - [ ] `datetime`
10. What to do if a `UnicodeDecodeError` occurs when reading a file in a Python script?
    - [x] Try a different encoding or handle the exception
    - [ ] Skip the error line, it's not critical
    - [ ] The file will be deleted, so create a backup copy
    - [ ] Do nothing, the error is ignored
11. What is the `crontab -l` command used for?
    - [x] To view current tasks
    - [ ] To edit tasks
    - [ ] To delete all tasks
    - [ ] To start the cron service
12. What advantages does Web API integration provide in CI/CD?
    - [x] Linking GitHub, GitLab, Jenkins; integration with code analysis tools; project management synchronization
    - [ ] Development acceleration, but only for web applications
    - [ ] Test automation, communication and monitoring
    - [ ] Version control; experience sharing; code recommendations
13. Where does the cron scheduler look for crontab files?
    - [x] In `/var/spool/cron`, `/etc/anacrontab`, `/etc/cron.d`
    - [ ] In the user's home directory
    - [ ] In `/etc/crontab`, `/usr/local/etc/cron`, `/home/cron`
    - [ ] In `/tmp/cron`
14. Which Python module is best suited for logging configuration?
    - [x] `logging`
    - [ ] `print`
    - [ ] `sys`
    - [ ] `os`
15. What does `os.makedirs(path, exist_ok=True)` mean in Python?
    - [x] Creates directory with all parent folders, ignoring if it already exists
    - [ ] Creates directory and raises an error if it exists
    - [ ] Deletes existing directory
    - [ ] Renames directory
16. Which tools can be used for automatic log analysis?
    - [x] `grep`, `awk`, `sed`
    - [ ] Only text editors
    - [ ] `nano`, `vim`, `emacs`
    - [ ] Only web browsers
17. What does the parameter `sum(1 for _ in f)` mean in Python when counting file lines?
    - [x] Efficiently counts lines without loading the entire file into memory
    - [ ] Sums file contents
    - [ ] Deletes lines from file
    - [ ] Creates a copy of the file
18. What role do cloud platforms play in team development?
    - [x] Collaboration tools, version control, CI/CD pipelines
    - [ ] File storage, task writing, meeting planning
    - [ ] Backup, monitoring, security, customer interaction
    - [ ] Website hosting, code review, project management, customer interaction
19. What does the `*/15 * * * *` entry mean in crontab?
    - [x] Execute every 15 minutes
    - [ ] Execute every 15 hours
    - [ ] Execute 15 times per day
    - [ ] Execute at 15:00 every day
20. Which Python block is used for proper exception handling in automation?
    - [x] try-except
    - [ ] if-else
    - [ ] while-break
    - [ ] for-continue
21. Which HTTP method is commonly used to retrieve data through REST API?
    - [x] GET
    - [ ] POST
    - [ ] PUT
    - [ ] DELETE