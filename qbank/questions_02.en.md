# Questions on "Scripting Fundamentals"

## Knowledge

1. What are environment variables?
   - [x] Dynamic values that can affect the behavior of processes in the operating system
   - [ ] Static values stored in configuration files
   - [ ] Variables accessible only within Shell scripts
   - [ ] Constants defined during system compilation
2. Which environment variable defines the list of directories to search for executable files?
   - [x] `PATH`
   - [ ] `HOME`
   - [ ] `USER`
   - [ ] `SHELL`
3. Which symbol is used in Bash to denote the beginning of a shebang?
   - [x] `#!`
   - [ ] `#/`
   - [ ] `!/`
   - [ ] `@!`
4. What will happen when executing the command `name = "John"` with spaces around the equals sign?
   - [x] An error will occur
   - [ ] The variable will be created correctly
   - [ ] The value will be assigned with spaces
   - [ ] The command will be ignored
5. Which syntax is used to get the length of a string in Bash?
   - [x] `${#variable}`
   - [ ] `$(variable#)`
   - [ ] `len(${variable})`
   - [ ] `${variable}.length`
6. How to perform arithmetic operations with integers in Bash?
   - [x] Using double parentheses `(( ))`
   - [ ] Using single parentheses `( )`
   - [ ] Using square brackets `[ ]`
   - [ ] Using curly braces `{ }`
7. Which tool is used for operations with floating-point numbers in Bash?
   - [x] `bc` (Basic Calculator)
   - [ ] `calc`
   - [ ] `math`
   - [ ] None, Bash works perfectly with floats
8. What is the difference between single and double quotes when working with strings?
   - [x] Variables are not interpolated in single quotes, but are interpolated in double quotes
   - [ ] Single quotes are used for numbers, double quotes for strings
   - [ ] There is no difference, you can use any
   - [ ] Single quotes are processed faster
9. Which syntax is used to extract a substring in Bash?
   - [x] `${variable:start:length}`
   - [ ] `${variable[start:length]}`
   - [ ] `substr(${variable},start,length)`
   - [ ] `${variable}.substring(start,length)`
10. How to get all elements of an array in Bash?
    - [x] `${array[@]}`
    - [ ] `${array[*all]}`
    - [ ] `${array.all}`
    - [ ] `${array[0..n]}`
11. Which comparison operator is used to check numerical equality in Bash?
    - [x] `-eq`
    - [ ] `==`
    - [ ] `-equal`
    - [ ] `=`
12. Which comparison operator is used to check if one number is less than another?
    - [x] `-lt`
    - [ ] `<`
    - [ ] `less`
    - [ ] `-less`
13. Which operator checks that a file exists and is a regular file in Bash?
    - [x] `-f`
    - [ ] `-e`
    - [ ] `-d`
    - [ ] `-r`
14. What does the `&&` operator mean on the command line?
    - [x] Executes the second command only if the first one completed successfully
    - [ ] Executes both commands in parallel
    - [ ] Executes the second command only if the first one failed
    - [ ] Combines the output of two commands
15. What does the `||` operator mean on the command line?
    - [x] Executes the second command only if the first one failed
    - [ ] Executes both commands in parallel
    - [ ] Executes the second command only if the first one completed successfully
    - [ ] Combines the output of two commands
16. Which construct is used to check multiple conditions in if statements in Bash?
    - [x] `elif`
    - [ ] `elseif`
    - [ ] `else if`
    - [ ] `case`
17. How to create a numeric range in a for loop in Bash?
    - [x] `{start..end}`
    - [ ] `[start..end]`
    - [ ] `(start..end)`
    - [ ] `start:end`
18. What is the difference between while and until loops in Bash?
    - [x] `while` executes while the condition is true, `until` - while the condition is false
    - [ ] `while` is faster, `until` is slower
    - [ ] `while` is for numbers, `until` is for strings
    - [ ] There is no difference, they are synonyms
19. How to declare a local variable inside a function in Bash?
    - [x] `local variable_name=value`
    - [ ] `var variable_name=value`
    - [ ] `private variable_name=value`
    - [ ] `scope variable_name=value`
20. Which variable contains the number of arguments passed to the script in Bash?
    - [x] `$#`
    - [ ] `$@`
    - [ ] `$*`
    - [ ] `$0`
21. What does the `set -e` command do in Bash?
    - [x] Terminates script execution on the first error
    - [ ] Enables debug mode
    - [ ] Exports all variables
    - [ ] Sets UTF-8 encoding
22. Which symbol is used to execute a command in the background in Bash?
    - [x] `&`
    - [ ] `%`
    - [ ] `*`
    - [ ] `@`

## Understanding

1. How to add directory `/opt/myapp/bin` to the `PATH` variable in Bash?
   - `export PATH=$PATH:/opt/myapp/bin`
   - `export PATH=/opt/myapp/bin:$PATH`
2. How to declare a variable `version` with value "2.0.5" in Bash?
   - `version="2.0.5"`
3. How to declare a variable `app_name` with value "myapp" in Bash?
   - `app_name="myapp"`
4. How to calculate the sum of two integers `a` and `b` in Bash and store the result in variable `sum`?
   - `sum=$((a + b))`
   - `sum=$(echo "$a + $b" | bc)`
5. How to calculate the product of two integers `a` and `b` in Bash and store the result in variable `product`?
   - `product=$((a * b))`
   - `product=$(echo "$a * $b" | bc)`
6. How to calculate the sum of two floating-point numbers `3.14` and `2.86` in Bash using `bc`?
   - `echo "3.14 + 2.86" | bc`
7. How to get the length of a string stored in variable `text` in Bash?
   - `${#text}`
8. How to extract a substring from variable `str="Hello, World!"` starting at position 7 with length 5 in Bash?
   - `${str:7:5}`
9. How to replace all occurrences of character "o" with "O" in variable `text="Hello, World!"` in Bash?
   - `${text//o/O}`
10. Given the following Bash code:

    ```bash
    text="Hello, World!"
    echo "${text//l/L}"
    ```

    What will be printed to the screen as a result of executing this code?
    - `HeLLo, WorLd!`
11. How to add element "orange" to an existing array `fruits` in Bash?
    - `fruits+=("orange")`
    - `fruits[${#fruits[@]}]="orange"`
12. How to delete file `installation.log` in the terminal?
    - `rm installation.log`
13. How to create file `config.txt` with content `APP_NAME=app` in the terminal?
    - `echo "APP_NAME=app" > config.txt`
14. How to create directory `logs` and navigate into it in the terminal?
    - `mkdir logs && cd logs`
    - `mkdir logs; cd logs`
15. How to list files (including hidden ones) in directory `/app/bin` with detailed information in the terminal?
    - `ls -la /app/bin`

## Integration

1. Write a Bash script that:
   1. Reads the environment variable `APP_ENV`.
   2. If `APP_ENV` is not set, prints the message "APP_ENV is not set" and exits with code 1.
   3. Reads the environment variable `BRANCH_NAME`.
   4. If `BRANCH_NAME` is not set, sets its value to "main".
   5. Clones the Git repository `https://gitlab.local/tesseract/tesseract.git` into the directory `/opt/tesseract`
   6. Changes to the directory `/opt/tesseract`.
   7. Switches to the branch named in the `BRANCH_NAME` variable.
   8. Executes the command `make deploy`.
   9. If the `make deploy` command succeeds, prints the message "Deployment succeeded!".
   10. Logs all steps to the file `/var/log/deploy.log`.
2. Write a Bash script that:
   1. Reads the environment variable `DB_HOST`.
   2. If `DB_HOST` is not set, prints the message "DB_HOST is not set" and exits with code 1.
   3. Reads the environment variable `DB_PORT`.
   4. If `DB_PORT` is not set, sets its value to "5432".
   5. Reads the environment variable `DB_USER`.
   6. If `DB_USER` is not set, prints the message "DB_USER is not set" and exits with code 1.
   7. Reads the environment variable `DB_PASSWORD`.
   8. If `DB_PASSWORD` is not set, prints the message "DB_PASSWORD is not set" and exits with code 1.
   9. Executes the SQL database migration command using the file `migrations.sql`:
      `psql -h $DB_HOST -p $DB_PORT -U $DB_USER -f migrations.sql`
   10. Logs all steps to the file `/var/log/db_migration.log`.
3. Write a Bash script that:
   1. Reads the environment variable `SERVICE_NAME`.
   2. If `SERVICE_NAME` is not set, prints the message "SERVICE_NAME is not set" and exits with code 1.
   3. Reads the environment variable `SERVICE_PORT`.
   4. If `SERVICE_PORT` is not set, sets its value to "8080".
   5. Checks if the service named in the `SERVICE_NAME` variable is running using the command `systemctl is-active $SERVICE_NAME`.
   6. If the service is not running, attempts to start it using the command `systemctl start $SERVICE_NAME`.
   7. After the start attempt, checks the service status again.
   8. If the service is running successfully, prints the message "Service $SERVICE_NAME is running on port $SERVICE_PORT".
   9. If the service failed to start, prints the message "Failed to start service $SERVICE_NAME".
   10. Logs all steps to the file `/var/log/service_check.log`.
4. Write a Bash script that:
   1. Reads the environment variable `BACKUP_DIR`.
   2. If `BACKUP_DIR` is not set, prints the message "BACKUP_DIR is not set" and exits with code 1.
   3. Reads the environment variable `SOURCE_DIR`.
   4. If `SOURCE_DIR` is not set, prints the message "SOURCE_DIR is not set" and exits with code 1.
   5. Checks if the directory `BACKUP_DIR` exists. If not, creates it using the command `mkdir -p $BACKUP_DIR`.
   6. Checks if the directory `SOURCE_DIR` exists. If not, prints the message "SOURCE_DIR does not exist" and exits with code 1.
   7. Creates an archive named `backup_YYYYMMDD_HHMMSS.tar.gz`, where `YYYYMMDD_HHMMSS` is the current date and time, containing the contents of the directory specified in `SOURCE_DIR`.
   8. Saves the created archive to the directory specified in `BACKUP_DIR`.
   9. If the archive is created successfully, prints the message "Backup created successfully at $BACKUP_DIR/backup_YYYYMMDD_HHMMSS.tar.gz".
   10. Logs all steps to the file `/var/log/backup.log`.
5. Write a Bash script that:
   1. Reads the environment variable `WATCH_DIR`.
   2. If `WATCH_DIR` is not set, prints the message "WATCH_DIR is not set" and exits with code 1.
   3. Reads the environment variable `MAX_USAGE` (maximum disk usage percentage).
   4. If `MAX_USAGE` is not set, sets its value to "80".
   5. Reads the environment variable `FILE_AGE_DAYS` (file age for deletion in days).
   6. If `FILE_AGE_DAYS` is not set, sets its value to "30".
   7. Checks the current disk usage for the directory `WATCH_DIR` using the command `df`.
   8. If the usage exceeds `MAX_USAGE`, finds and deletes files older than `FILE_AGE_DAYS` days in the directory `WATCH_DIR` using the command `find $WATCH_DIR -type f -mtime +$FILE_AGE_DAYS -delete`.
   9. After cleanup, prints a message with the amount of freed space.
   10. Logs all steps to the file `/var/log/disk_cleanup.log`.
6. Write a Bash script that:
   1. Reads the environment variable `DOCKER_IMAGE`.
   2. If `DOCKER_IMAGE` is not set, prints the message "DOCKER_IMAGE is not set" and exits with code 1.
   3. Reads the environment variable `CONTAINER_NAME`.
   4. If `CONTAINER_NAME` is not set, sets its value to "app".
   5. Reads the environment variable `CONTAINER_PORT`.
   6. If `CONTAINER_PORT` is not set, sets its value to "8080".
   7. Checks if a container with the name `CONTAINER_NAME` exists using the command `docker ps -a`. If it exists, stops it with the command `docker stop $CONTAINER_NAME` and removes it with the command `docker rm $CONTAINER_NAME`.
   8. Executes the command `docker pull $DOCKER_IMAGE` to pull the image.
   9. Runs the container with the command `docker run -d --name $CONTAINER_NAME -p $CONTAINER_PORT:$CONTAINER_PORT $DOCKER_IMAGE` and upon successful start, prints the message "Container $CONTAINER_NAME started successfully on port $CONTAINER_PORT".
   10. Logs all steps to the file `/var/log/docker_deploy.log`.
