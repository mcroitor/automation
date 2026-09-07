# Basics of Scripting

## Slide 0. Basics of Scripting

```slide:title
+----------------------------------------------------------------+
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                       Basics of Scripting                      |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
|                                                                |
|                                                 Automation     |
|                                                 Course, 2026   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Welcome. Today's lesson is "Basics of Scripting", the second module of the Automation and Scripting course.

We will move from running single commands to writing real Bash scripts that automate routine work. By the end, you will be able to set up your environment, write and structure scripts, handle errors, and combine everything into small, reliable tools.

## Slide 1. Environment Setup

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                    Environment Setup                   |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |        "Stay here with us and fix it up."              |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Before writing any script, we need to understand the environment it runs in.

A script behaves differently depending on the variables, tools, and shell it inherits. So we start with two foundations: environment variables and the command line tools we will build scripts around.

## Slide 2. Environment Variables

```slide:content
+----------------------------------------------------------------+
| Environment Variables                                          |
|                                                                |
+----------------------------------------------------------------+
| - Dynamic values that shape process behavior.                  |
| - PATH: where executables are searched.                        |
| - HOME, USER, SHELL: identity and shell.                       |
| - LANG, EDITOR, TMPDIR: preferences and paths.                 |
| - PWD / OLDPWD: current and previous directory.                |
| - Set with export: export PATH=$PATH:/new/dir                  |
| - Session-scoped unless saved to ~/.bashrc or ~/.zshrc.        |
+----------------------------------------------------------------+
```

__Comment:__ Environment variables are dynamic values that influence how processes behave.

The most important one is PATH, which tells the system where to look for executables. Others like HOME, USER, and SHELL describe the user and shell, while LANG, EDITOR, and TMPDIR control preferences and locations.

You set or change them with the export command. Keep in mind that changes are session-specific unless you persist them in a shell configuration file such as .bashrc or .zshrc.

## Slide 3. Command Line Tools

```slide:two-columns
+----------------------------------------------------------------+
| Command Line Tools                                             |
|                                                                |
+-----------------------------+----------------------------------+
| - ls, cd, pwd: navigate     | - cp, mv, rm: copy, move, delete |
| - mkdir, rmdir, touch       | - cat, echo: read and print      |
| - find: locate files        | - grep, awk: search and process  |
| - bc: arithmetic            | - Combine with pipes and I/O     |
|                             |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ The command line interface is a text-based way to interact with the system, and it is the raw material of scripting.

On the left are the everyday tools: navigation with ls, cd, and pwd; file management with cp, mv, rm, mkdir, and touch; and searching with find.

On the right are processing tools: cat and echo for reading and printing, grep and awk for searching and transforming text, and bc for arithmetic. The real power comes from combining them with pipes and redirections.

## Slide 4. Pipes and Redirections

```slide:content
+----------------------------------------------------------------+
| Pipes and Redirections                                         |
|                                                                |
+----------------------------------------------------------------+
| - | : pipe output of one command into another.                 |
| - > / >> : write to file, overwrite or append.                 |
| - < : read input from a file.                                  |
| - 2> / &> : redirect errors, or both streams.                  |
| - && / || : run next on success / on failure.                  |
| - ; : run commands sequentially.                               |
| - $( ) : capture command output.                               |
| - Example: ls -l | grep "\.txt$" > out.txt 2> err.log          |
+----------------------------------------------------------------+
```

__Comment:__ These operators let us chain simple commands into complex operations.

The pipe sends one command's output into the next. The greater-than signs redirect output to a file, either overwriting or appending. The double operators and semicolon control the order and conditions under which commands run.

And command substitution with dollar-parentheses lets you capture a command's output into a variable. For example, this pipeline lists text files, saves them to a file, and logs errors separately.

## Slide 5. Writing Shell Scripts in Bash

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |              Writing Shell Scripts in Bash             |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |        "True automation is combining commands."        |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Individual commands are powerful, but real automation comes from combining them into scripts.

A shell script is just a text file of commands, variables, and control structures. It makes workflows repeatable and reduces manual effort. This is the core of today's lesson.

## Slide 6. Script Structure

```slide:content
+----------------------------------------------------------------+
| Script Structure                                               |
|                                                                |
+----------------------------------------------------------------+
| - A script is a text file of commands and logic.               |
| - Use the .sh extension by convention.                         |
| - Start with a shebang: #!/bin/bash                            |
| - Shebang selects the interpreter.                             |
| - Make it executable: chmod +x script.sh                       |
| - Run it: ./script.sh                                          |
| - Example: echo "Hello, World!" then date                      |
+----------------------------------------------------------------+
```

__Comment:__ Every Bash script starts with a shebang line that tells the system which interpreter to use.

For Bash, that is the hash-bang slash-bin-bash. After that, commands run in the order they are written.

To run a script, you first make it executable with chmod plus-x, then invoke it with a dot-slash prefix. This tiny example prints a greeting and the current date.

## Slide 7. Variables and Data Types

```slide:content
+----------------------------------------------------------------+
| Variables and Data Types                                       |
|                                                                |
+----------------------------------------------------------------+
| - Create: name="John"  (no spaces around =)                    |
| - Read: $name or ${name}                                       |
| - Untyped by default; treated as strings.                      |
| - Integers: sum=$((num1 + num2))                               |
| - Floats: use bc, e.g. echo "10.5 + 5.3" | bc                  |
| - Strings: single quotes literal, double quotes expand.        |
| - Arrays: ordered, indexed collections.                        |
+----------------------------------------------------------------+
```

__Comment:__ Variables let us store and manipulate data. In Bash they are created by simple assignment, with no spaces around the equals sign.

You read them with a dollar sign, and it is good practice to wrap them in curly braces to avoid ambiguity. Bash variables are untyped and treated as strings, but context lets them hold numbers or arrays.

For integers we use double-parenthesis arithmetic. For floats we rely on the bc calculator. And single versus double quotes control whether variables are expanded.

## Slide 8. String Operations

```slide:content
+----------------------------------------------------------------+
| String Operations                                              |
|                                                                |
+----------------------------------------------------------------+
| - Length: ${#str}                                              |
| - Substring: ${str:start:length}                               |
| - Replace one: ${str/pattern/replacement}                      |
| - Replace all: ${str//pattern/replacement}                     |
| - Uppercase: ${str^^}                                          |
| - Lowercase: ${str,,}                                          |
| - Example: ${str:7} -> "World!"                                |
+----------------------------------------------------------------+
```

__Comment:__ Bash has built-in string operations that make text processing easy.

You can get a string's length, extract a substring by start and length, and replace a pattern with a new value. Using a double slash replaces every occurrence.

You can also convert case with the double-caret for uppercase and double-comma for lowercase. These small operators cover most everyday text manipulation.

## Slide 9. Arrays

```slide:content
+----------------------------------------------------------------+
| Arrays                                                         |
|                                                                |
+----------------------------------------------------------------+
| - Create: fruits=("apple" "banana" "cherry")                   |
| - Access: ${fruits[0]}  (index starts at 0)                    |
| - All elements: ${fruits[@]}                                   |
| - Size: ${#fruits[@]}                                          |
| - Add: fruits[3]="orange"  or  fruits+=("grape")               |
| - Iterate: for i in "${!fruits[@]}"                            |
| - Great for file lists and command arguments.                  |
+----------------------------------------------------------------+
```

__Comment:__ Arrays are ordered collections where each element has an index starting at zero.

You create them with parentheses, access elements by index, and retrieve everything with the at-sign. The size is available with the hash-at-sign syntax.

You can append elements with the plus-equals operator, and iterate over indices with the exclamation-at-sign form. Arrays are ideal for handling lists of files or command-line arguments.

## Slide 10. Conditional Operators

```slide:two-columns
+-----------------------------------------------------------------+
| Conditional Operators                                           |
|                                                                 |
+-----------------------------+-----------------------------------+
| Numeric:                    | String:                           |
| - -eq, -ne: equal, not      | - =, ==: equal                    |
| - -lt, -le: less, less-eq   | - !=: not equal                   |
| - -gt, -ge: greater, g-eq   | - -z, -n: empty, non-empty        |
|                             | - <, >: lexicographic (use [[ ]]) |
| File:                       | Logical:                          |
| - -f, -d, -e: file, dir, ex | - && : AND                        |
| - -r, -w, -x: permissions   | - || : OR                         |
| - -s: non-empty             | - ! : NOT                         |
+-----------------------------+-----------------------------------+
```

__Comment:__ Conditions and loops both rely on comparison operators, so let's look at those first.

For numbers we have the eq, ne, lt, le, gt, and ge operators. For strings we compare equality, emptiness, and lexicographic order, where the last one is best done inside double brackets.

File operators let us test existence, type, and permissions. And the logical operators and, or, and not let us combine conditions into more complex decisions.

## Slide 11. if Statement

```slide:content
+----------------------------------------------------------------+
| if Statement                                                   |
|                                                                |
+----------------------------------------------------------------+
| - if [ condition ]; then ... else ... fi                       |
| - Condition is true or false.                                  |
| - Empty string or 0 is false; else true.                       |
| - else branch is optional.                                     |
| - elif chains multiple conditions.                             |
| - Quote variables: [ "$x" -lt 5 ]                              |
| - Example: age < 18 -> Minor, <= 65 -> Adult, else Senior      |
+----------------------------------------------------------------+
```

__Comment:__ The if statement is the main branching construct in Bash.

The condition evaluates to true or false, where an empty string or zero counts as false. The else branch is optional, and you can chain multiple checks with elif.

Always quote your variables inside the test to avoid problems with empty or spaced values. This example classifies an age into minor, adult, or senior.

## Slide 12. Loops

```slide:content
+----------------------------------------------------------------+
| Loops                                                          |
|                                                                |
+----------------------------------------------------------------+
| - for item in list; do ... done                                |
| - for i in {1..5}: numeric range                               |
| - for i in "${!array[@]}": iterate by index                    |
| - while [ condition ]; do ... done                             |
| - until [ condition ]; do ... done                             |
| - while runs while true; until runs while false.               |
| - Use ((count++)) to advance a counter.                        |
+----------------------------------------------------------------+
```

__Comment:__ Loops let scripts repeat work. The for loop iterates over a list, a numeric range, or array indices.

The while loop keeps running as long as its condition is true, and the until loop is the opposite, running while the condition is false.

In both cases you typically advance a counter with the double-parenthesis increment. Together, these three loops cover nearly all repetition you will need.

## Slide 13. Functions

```slide:content
+----------------------------------------------------------------+
| Functions                                                      |
|                                                                |
+----------------------------------------------------------------+
| - name() { commands }  or  function name { commands }          |
| - Args via positional params: $1, $2, ...                      |
| - $# : count of args; $@ : all args                            |
| - Return value via standard output.                            |
| - Capture: value=$(sum 3 5)                                    |
| - local keyword limits variable scope.                         |
| - Script params: $0 name, $1.., $#, $@, $*                     |
+----------------------------------------------------------------+
```

__Comment:__ Functions structure code, improve readability, and enable reuse.

You declare them with a name and a body, and pass arguments through positional parameters. The special variables give you the argument count and the full argument list.

A function returns its result through standard output, which you can capture with command substitution. Use the local keyword to keep variables scoped to the function, and the same parameter rules apply to the script itself.

## Slide 14. Error Handling

```slide:content
+----------------------------------------------------------------+
| Error Handling                                                 |
|                                                                |
+----------------------------------------------------------------+
| - Exit code in $? : 0 success, else error.                     |
| - Check: if [ "$?" -ne 0 ]; then ... fi                        |
| - set -e : stop on first error.                                |
| - Strict mode: set -euo pipefail                               |
|   -e error, -u undefined vars, -o pipefail                     |
| - && / || : conditional execution chains.                      |
| - Example: mkdir d && echo ok || echo fail                     |
+----------------------------------------------------------------+
```

__Comment:__ Error handling is what makes scripts reliable. Every command returns an exit code stored in the question-mark variable, where zero means success.

You can check that code explicitly, or use set-e to stop the script on the first failure. For production scripts, the recommended strict mode combines e, u, and pipefail.

And the and/or operators let you build simple success-or-failure chains, like creating a directory and reporting the outcome.

## Slide 15. Calling External Commands

```slide:content
+----------------------------------------------------------------+
| Calling External Commands                                      |
|                                                                |
+----------------------------------------------------------------+
| - Run by name: command [arguments]                             |
| - Run a script: ./a_script.sh [arguments]                      |
| - Runs in a separate process.                                  |
| - Capture output: date=$(date)                                 |
| - Background: long_task &                                      |
| - Combine with $() for results.                                |
| - Foundation for real automation.                              |
+----------------------------------------------------------------+
```

__Comment:__ A script can call external commands and other scripts by simply naming them with their arguments.

Each call runs in a separate process, and you can capture its output into a variable with command substitution. If a task is long-running, you can send it to the background with the ampersand.

This is the bridge from scripting to real automation, because your scripts can orchestrate any tool on the system.

## Slide 16. Thank You

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                      THANK YOU!                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                        Any question?   |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ That wraps up the basics of scripting.

You now know how to set up your environment, write and structure Bash scripts, handle data and control flow, manage errors, and combine it all into small, reliable tools.

Thank you for your attention. Any questions?
