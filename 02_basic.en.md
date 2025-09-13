# Basics of Scripting

> "And what do you have to offer?"<br>
> "What do we have?" - asked Hawk-nose, turning around.<br>
> "Aldan-three," - said The Beard.<br>
> "A well-endowed machine," - I said. - "Has it been running well?"<br>
> "Well, how shall I say..<br>
> "I get it," - I said.<br>
> "As a matter of fact, it hasn't been debugged yet," - said The Beard. - "Stay here with us and fix it up."
>
> __A. and B. Strugatsky, *Monday Begins on Saturday*__

- [Basics of Scripting](#basics-of-scripting)
  - [Environment Setup](#environment-setup)
    - [Environment Variables](#environment-variables)
    - [Command Line Tools](#command-line-tools)
  - [Writing Shell Scripts in Bash](#writing-shell-scripts-in-bash)
    - [Variables and Data Types](#variables-and-data-types)
      - [Integers](#integers)
      - [Floating-point Numbers](#floating-point-numbers)
      - [Strings](#strings)
      - [Arrays](#arrays)
    - [Conditional Operators and Loops](#conditional-operators-and-loops)
      - [Comparison Operators](#comparison-operators)
      - [if Statement](#if-statement)
      - [for Loop](#for-loop)
      - [while Loop](#while-loop)
      - [until Loop](#until-loop)
    - [Functions](#functions)
      - [Local Variables](#local-variables)
      - [Shell Script Parameters](#shell-script-parameters)
    - [Error Handling](#error-handling)
    - [Calling External Commands and Scripts](#calling-external-commands-and-scripts)
    - [Examples of Simple Scripts](#examples-of-simple-scripts)
      - [Example 1. File Backup](#example-1-file-backup)
      - [Example 2. Counting lines in a file](#example-2-counting-lines-in-a-file)
      - [Example 3. Counting lines in a file, functional style](#example-3-counting-lines-in-a-file-functional-style)
      - [Example 4. Merging multiple text files into one](#example-4-merging-multiple-text-files-into-one)
  - [Bibliography](#bibliography)

## Environment Setup

Before diving into scripting, it is crucial to understand the environment in which your scripts will operate. Proper environment configuration ensures predictable script behavior and smooth integration with system resources.

### Environment Variables

_Environment variables_ are dynamic values that influence the behavior of processes within an operating system. They are commonly used to store configuration details such as executable search paths, user preferences, and application-specific parameters. Mastery of environment variables is fundamental for effective automation.

Key environment variables in Unix-like systems (such as Linux and macOS) include:

- `PATH`: Specifies directories to search for executable files. When a command is entered, the system searches these directories in order to locate the executable.
- `HOME`: Indicates the current user's home directory, where personal files and settings are stored.
- `USER`: Stores the current user's name.
- `SHELL`: Identifies the command-line shell in use (e.g., `/bin/bash`, `/bin/zsh`).
- `LANG`: Sets language and regional preferences for applications.
- `EDITOR`: Defines the preferred command-line text editor (e.g., `vim`, `nano`, `emacs`).
- `TMPDIR`: Points to the directory for temporary files.
- `PWD`: Contains the current working directory.
- `OLDPWD`: Contains the previous working directory.

Users and applications can set or modify environment variables. In Unix-like systems, this is typically accomplished with the `export` command. For example, to append a directory to the `PATH` variable:

```bash
export PATH=$PATH:/new/directory/path
```

> [!NOTE]
> Environment variable changes are session-specific unless added to a shell configuration file such as `~/.bashrc`, `~/.bash_profile`, or `~/.zshrc`.

### Command Line Tools

The *command line interface* (CLI) is a text-based environment for interacting with the operating system and applications. Unlike graphical user interfaces (GUIs), the CLI enables direct command entry, offering powerful capabilities for system management, task automation, and troubleshooting.

Some of the most frequently used command line tools in Unix-like systems include:

- `ls`: Lists files and directories in the current directory.
- `cd`: Changes the current working directory.
- `pwd`: Prints the full path of the current working directory.
- `cp`: Copies files and directories.
- `mv`: Moves or renames files and directories.
- `rm`: Removes files and directories.
- `mkdir`: Creates new directories.
- `rmdir`: Removes empty directories.
- `touch`: Creates an empty file or updates the timestamp of an existing file.
- `cat`: Displays the contents of a file.
- `echo`: Prints text or variable values to the screen.
- `bc`: Command-line calculator for arithmetic operations.
- `find`: Searches for files and directories based on specified criteria.
- `awk`: Advanced text processing and data extraction tool.
- `grep`: Searches for text patterns within files.

Commands can be combined using pipes and redirections to create complex operations. For example, the command `ls -l | grep "\.txt$"` will output a list of all files with a `.txt` extension in the current directory. The following operators exist:

- `|` (pipe): redirects the output of one command to the input of another command.
- `>`: redirects command output to a file, overwriting its contents.
- `>>`: redirects command output to a file, appending to existing contents.
- `<`: redirects command input from a file.
- `2>`: redirects standard error stream to a file.
- `&>`: redirects both standard output and standard error stream to a file.
- `&&`: executes the second command only if the first command completed successfully (return code 0).
- `||`: executes the second command only if the first command completed with an error (return code not 0).
- `;`: allows executing multiple commands sequentially, regardless of the result of the previous command.
- `$()`: executes the command inside parentheses and returns its output, which can be used in another command.

Example of using operators:

```bash
# Finds all text files in the current directory and saves them to a file, 
# while writing errors to a separate log file
ls -l | grep "\.txt$" > txt_files.txt 2> errors.log
```

## Writing Shell Scripts in Bash

While individual command line instructions are powerful, true automation is achieved by combining commands into scripts. A shell script is a text file containing a sequence of commands, variables, and control structures. Scripts enable the automation of complex workflows, reduce manual effort, and ensure repeatability of routine operations.

Shell scripts in Unix-like systems typically use the `.sh` extension. Each script should begin with a *shebang* line, which specifies the interpreter to be used for execution. For Bash scripts, the shebang is:

```bash
#!/bin/bash
```

Following the shebang, commands are listed in the order they should be executed. For example, the following script prints a greeting and the current date:

```bash
#!/bin/bash
echo "Hello, World!"
date
```

To run a script, it must be made executable with `chmod +x script.sh`, then executed using `./script.sh`.

### Variables and Data Types

Variables are fundamental to scripting, allowing you to store and manipulate data. In Bash, variables are created by assigning a value directly:

```bash
#!/bin/bash
name="John"
age=30
```

> [!NOTE]
> Variable initialization in Bash should not have spaces around the equals sign `=`.

To reference a variable's value, prefix its name with a dollar sign (`$`). Curly braces (`{}`) can be used to clearly delimit the variable name, which is especially useful in complex expressions:

```bash
echo "Name: $name"
echo "Age: ${age}"
```

> [!NOTE]
> When using variables inside strings, it is recommended to enclose them in curly braces `${variable}` to avoid ambiguities.

Bash variables are untyped by default and are treated as strings. However, depending on context, they can represent numbers or arrays. Understanding how to work with different data types is essential for writing robust scripts.

#### Integers

To perform arithmetic operations with integers in Bash, double parentheses `(( ))` are used:

```bash
num1=10
num2=5
sum=$((num1 + num2))
echo "Sum: ${sum}"
```

#### Floating-point Numbers

Bash does not support floating-point operations, so for working with real numbers, the console calculator `bc` (Basic Calculator) is used:

```bash
num1=10.5
num2=5.3
sum=$(echo "${num1} + ${num2}" | bc)
echo "Sum: ${sum}"
```

#### Strings

Strings are sequences of characters enclosed in either single or double quotes. The choice of quotes affects how variables are interpreted: single quotes preserve the literal value of each character, while double quotes allow variable interpolation and command substitution.

```bash
greeting="Hello"
echo '${greeting}, World!'  # Outputs: ${greeting}, World!
echo "${greeting}, World!"   # Outputs: Hello, World!
```

Bash provides several built-in mechanisms for manipulating strings, including obtaining string length, extracting substrings, performing replacements, and changing case. Mastery of these operations is essential for effective text processing in scripts.

__Getting String Length__
To get the length of a string, use the syntax `${#variable}`:

```bash
str="Hello"
echo "Length: ${#str}"  # Output: Length: 5
```

__Substring Extraction__
To extract a substring, use the following syntax `${variable:start:length}`:

```bash
str="Hello, World!"
echo "Substring: ${str:7:5}"  # Output: Substring: World
```

If the length is not specified, the substring from the starting position to the end of the string will be extracted:

```bash
str="Hello, World!"
echo "Substring: ${str:7}"  # Output: Substring: World!
```

__String Replacement__
To replace a substring, use the following syntax `${variable/pattern/replacement}`:

```bash
str="Hello, World!"
echo "Replaced: ${str/World/Bash}"  # Output: Replaced: Hello, Bash!
```

To replace all occurrences, double slash `//` is used (`${variable//pattern/replacement}`):

```bash
str="Hello, World!"
echo "Replaced all: ${str//o/O}"      # Output: Replaced all: HellO, WOrld!
```

__Case Conversion__
To convert characters to uppercase, the notation `${variable^^}` is used:

```bash
str="Hello, World!"
echo "Uppercase: ${str^^}"  # Output: Uppercase: HELLO, WORLD!
```

To convert characters to lowercase, the notation `${variable,,}` is used:

```bash
str="Hello, World!"
echo "Lowercase: ${str,,}"  # Output: Lowercase: hello, world!
```

#### Arrays

Arrays in Bash are ordered collections of elements, each identified by an index. Arrays are invaluable for handling lists of files, command-line arguments, or the results of command execution. Understanding array operations enables you to write scripts that efficiently process bulk data.

__Creating and initializing arrays:__
Arrays are defined using parentheses, with elements separated by spaces:

```bash
fruits=("apple" "banana" "cherry")
numbers=(1 2 3 4 5)
mixed=("text" 42 "another text")
```

__Accessing elements:__
Array elements are accessed by their index (starting from 0):

```bash
echo "First fruit: ${fruits[0]}"   # Outputs: First fruit: apple
echo "Second fruit: ${fruits[1]}"  # Outputs: Second fruit: banana
echo "Third fruit: ${fruits[2]}"   # Outputs: Third fruit: cherry
```

__Retrieving all elements:__
To retrieve all elements, use `${array[@]}` or `${array[*]}`:

```bash
echo "All fruits: ${fruits[@]}"  # Outputs: All fruits: apple banana cherry
```

__Determining array size:__
The number of elements in an array is given by `${#array[@]}`:

```bash
echo "Number of fruits: ${#fruits[@]}"  # Outputs: Number of fruits: 3
```

__Adding elements:__
Add new elements by specifying an index or using the `+=` operator:

```bash
fruits[3]="orange"
fruits+=("grape" "kiwi")
```

### Conditional Operators and Loops

Control flow is a cornerstone of programming, and Bash provides a rich set of conditional operators and loops to direct script execution. These constructs allow scripts to make decisions and perform repetitive tasks, greatly increasing their power and flexibility.

Both conditional operators and loops rely on comparison operators to evaluate conditions and determine the appropriate execution path.

#### Comparison Operators

Bash supports a variety of comparison operators for evaluating conditions within scripts. These operators are grouped by the type of data they compare—numbers, strings, and files. Understanding these operators is essential for writing effective conditional logic.

__Numeric comparison operators:__

- `-eq` : equal
- `-ne` : not equal
- `-lt` : less than
- `-le` : less or equal
- `-gt` : greater than
- `-ge` : greater or equal

Example:

```bash
num1=10
num2=20
if [ "${num1}" -lt "${num2}" ]; then
  echo "${num1} is less than ${num2}"
fi
```

__String comparison operators:__

- `=` or `==` : strings are equal
- `!=` : strings are not equal
- `<` : string is lexicographically less
- `>` : string is lexicographically greater
- `-z` : string is empty (zero length)
- `-n` : string is non-empty (non-zero length)

Example:

```bash
str1="hello"
str2="world"
if [ "${str1}" != "${str2}" ]; then
  echo "Strings are not equal"
fi
```

> [!NOTE]
> The variables inside conditional operators are recommended to be enclosed in double quotes to avoid errors when dealing with empty strings or strings containing spaces.

When using the `<` and `>` operators for strings in conditional expressions, it is necessary to escape them with a backslash (`\<` and `\>`) or use double square brackets `[[ ]]` to avoid conflicts with input/output redirection.

Example:

```bash
if [[ "${str1}" < "${str2}" ]]; then
  echo "${str1} is lexicographically less than ${str2}"
fi
```

__File operators:__

File operators allow scripts to test file properties, such as existence, type, and permissions:

- `-f` : object is a regular file
- `-d` : object is a directory
- `-e` : object exists
- `-r` : file is readable
- `-w` : file is writable
- `-x` : file is executable
- `-s` : file is non-empty

Example:

```bash
file="script.sh"
if [ -f "${file}" ] && [ -x "${file}" ]; then
  echo "File exists and is executable"
fi
```

__Logical operators:__

Logical operators enable the combination and negation of conditions, allowing for more complex decision-making:

- `&&` : logical AND
- `||` : logical OR
- `!` : logical NOT

Example:

```bash
age=25
if [ "${age}" -ge 18 ] && [ "${age}" -le 65 ]; then
  echo "Age is in working range"
fi
```

#### if Statement

The `if` statement is the primary branching construct in Bash, enabling scripts to execute commands conditionally. The general syntax is:

```bash
if [ condition ]; then
  commands_if_true
else
  commands_if_false
fi
```

The condition is evaluated as either true or false. For example, an empty string or the number 0 is considered false, while a non-empty string or any non-zero number is true.

The `else` branch is optional and can be omitted if no action is required when the condition is false.

Example:

```bash
if [ -f "file.txt" ]; then
  echo "File exists"
else
  echo "File does not exist"
fi
```

The `if` statement can be extended with `elif` (else if) to check multiple conditions:

```bash
if [ condition1 ]; then
    commands_if_condition1_true
elif [ condition2 ]; then
    commands_if_condition2_true
else
    commands_if_all_conditions_false
fi
```

The `elif` statement can be used multiple times to check different conditions.

Example:

```bash
if [ "${age}" -lt 18 ]; then
    echo "Minor"
elif [ "${age}" -le 65 ]; then
    echo "Adult"
else
    echo "Senior"
fi
```

#### for Loop

The `for` loop is used to iterate over elements in a list or array. Syntax:

```bash
for item in list; do
    commands
done
```

Example:

```bash
for fruit in apple banana cherry; do
    echo "I like ${fruit}"
done
```

Additionally, the `for` loop can be used to execute commands with a specific numeric range using the `{start..end}` construct:

```bash
for i in {1..5}; do
    echo "Number ${i}"
done
```

For iterating over array elements by index, the syntax is similar:

```bash
array=(one two three)
for index in "${!array[@]}"; do
  echo "Element $index: ${array[$index]}"
done
```

#### while Loop

The `while` loop executes commands while a condition is true. Syntax:

```bash
while [ condition ]; do
    commands
done
```

Example:

```bash
count=1
while [ "${count}" -le 5 ]; do
    echo "Count: ${count}"
    ((count++))
done
```

#### until Loop

The `until` loop executes commands while a condition is false. Syntax:

```bash
until [ condition ]; do
    commands
done
```

Example:

```bash
count=1
until [ "${count}" -gt 5 ]; do
    echo "Count: ${count}"
    ((count++))
done
```

### Functions

Functions are used to structure code, improve readability, and enable code reuse. The general form of function declaration in Bash is as follows:

```bash
function_name() {
  commands
}
```

or

```bash
function function_name {
  commands
}
```

Parameters are passed to the function through *positional parameters* `$1`, `$2`, etc. Special variables are also available within the function, such as `$#` (number of arguments passed) and `$@` (all arguments).

Return value is accomplished using the `return` command (integers only) or through output to standard stream.

Example:

```bash
sum() {
  echo $(( $1 + $2 ))
}
value=$(sum 3 5)
echo "Sum: ${value}"  # Output: Sum: 8
```

Function calls are made by its name with the necessary arguments:

```bash
function_name arg1 arg2
```

#### Local Variables

By default, all variables in Bash are global, even if they are defined inside a function. To limit the scope of a variable to the function only, the `local` keyword is used:

```bash
my_function() {
  local local_var="I am local"
  global_var="I am global"
  echo "${local_var}"
}
my_function
# echo "${local_var}"  # Error: local_var is not defined outside the function
echo "${global_var}"  # Output: I am global
```

#### Shell Script Parameters

Parameters passed to the script when called are available within the script through *positional parameters*, just like in functions. Main parameters:

- `$0`: script name;
- `$1`, `$2`, ...: first, second, etc. arguments;
- `$#`: number of arguments passed;
- `$@`: all arguments as separate words;
- `$*`: all arguments as one string.

Example:

```bash
#!/bin/bash
# Script to display passed arguments
echo "Script name: $0"
echo "Total arguments: $#"
echo "All arguments: $@"

for arg in "$@"; do
  echo "Argument: ${arg}"
done

echo "Done."
```

### Error Handling

Error handling is a critically important aspect of developing reliable scripts. Bash provides several approaches to error handling.

__Exit code checking:__
Each command in Bash returns an exit code, which is stored in the special variable `$?`. Code 0 means successful execution, any other value indicates an error.

```bash
cp file1.txt file2.txt
if [ "$?" -ne 0 ]; then
  echo "File copy error"
  exit 1
fi
```

__Automatic termination on error:__
The `set -e` option forces the script to terminate on the first error:

```bash
set -e
cp file1.txt file2.txt
# If an error occurs, script execution will stop
```

__Strict mode:__
For improved reliability, it's recommended to use a combination of options:

```bash
set -euo pipefail
# -e: terminate on error
# -u: error when using undefined variables  
# -o pipefail: error in any part of pipeline stops execution
```

__Logical operators for error handling:__
The `&&` and `||` operators allow creating conditional execution chains:

```bash
mkdir new_directory && echo "Directory created" || echo "Failed to create directory"
```

### Calling External Commands and Scripts

External commands and other scripts can be called from a Bash script by specifying their name and parameters. The call is made in a separate process, and the execution result can be used later.

General form:

```bash
command [arguments]
```

or

```bash
./a_script.sh [arguments]
```

Command execution results can be saved to a variable using the `$()` construct:

```bash
current_date=$(date)
echo "Current date: ${current_date}"
```

If you need to execute a command in background mode, use the `&` symbol:

```bash
long_running_task &
```

### Examples of Simple Scripts

Below are examples of simple scripts with explanation of results.

#### Example 1. File Backup

```bash
#!/bin/bash
# first argument is source file, second is destination
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 source_file destination_file"
  exit 1
fi

src="$1"
dest="$2"

cp "${src}" "${dest}"

if [ "$?" -eq 0 ]; then
  echo "Backup successful"
else
  echo "Backup failed"
fi
```

Result: if copying is successful, a success message will be displayed, otherwise an error message.

#### Example 2. Counting lines in a file

```bash
#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 file"
  exit 1
fi

file="${1}"

if [ ! -f "${file}" ]; then
  echo "File not found!"
  exit 1
fi

lines=$(wc -l < "${file}")

if [ "$?" -ne 0 ]; then
  echo "Error reading file"
  exit 1
fi

echo "Number of lines: ${lines}"
```

Result: the number of lines in the file will be displayed, or an error message if the file is not found or cannot be read.

#### Example 3. Counting lines in a file, functional style

```bash
#!/bin/bash

function count_lines() {
  local file="$1"
  lines=$(wc -l < "${file}")
  if [ "$?" -ne 0 ]; then
    echo "Error reading file"
    return 1
  fi
  echo "${lines}"
  return 0
}

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 file"
  exit 1
fi

if [ ! -f "${1}" ]; then
  echo "File not found!"
  exit 1
fi

result=$(count_lines "${1}")
echo "Number of lines: ${result}"
```

The script performs the same function as the previous one, but the line counting logic is defined in a separate function `count_lines`.

#### Example 4. Merging multiple text files into one

```bash
#!/bin/bash
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 output_file input_file1 [input_file2 ...]"
  exit 1
fi
output_file="${1}"
shift
cat "$@" > "${output_file}"
if [ "$?" -eq 0 ]; then
  echo "Files merged into ${output_file}"
else
  echo "Error merging files"
fi
```

Result: if merging is successful, a success message will be displayed, otherwise an error message.

## Bibliography

1. [Shell Scripting Tutorial](https://www.shellscript.sh/)
2. [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
3. [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
4. [The Linux Command Line](http://linuxcommand.org/tlcl.php)
5. [GNU Bash Manual](https://www.gnu.org/software/bash/manual/bash.html)
