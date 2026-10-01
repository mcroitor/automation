# Basics of Scripting

## Slide 1. Title

```slide:title
+----------------------------------------------------------------+
|                                                                |
|                                                                |
|                                                                |
|                      Basics of Scripting                       |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
|                                                                |
|                                                Mihail Croitor  |
|                               Automation and Scripting, 2026   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Welcome, everyone. Today's lesson is about the basics of scripting. We'll start with the environment scripts run in, then move to writing actual Bash scripts: variables, data types, control flow, functions, error handling, and finish with a few worked examples.

## Slide 2. Environment Setup

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                   Environment Setup                    |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Before we write a single line of a script, we need to understand the environment it will run in. Getting this right avoids a lot of confusing bugs later.

## Slide 3. Environment Variables

```slide:content
+----------------------------------------------------------------+
| Environment Variables                                          |
|                                                                |
+----------------------------------------------------------------+
| - Dynamic values that configure OS processes                   |
| - PATH: directories searched for executables                   |
| - HOME: current user's home directory                          |
| - USER: current user's name                                    |
| - SHELL: active command-line shell                             |
| - LANG: language/regional settings                             |
| - EDITOR: preferred CLI text editor                            |
| - TMPDIR, PWD, OLDPWD: temp/working dirs                       |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Environment variables store configuration such as search paths, user preferences, and application settings. Let's go through the most important ones you'll meet in Unix-like systems: PATH tells the shell where to look for executables; HOME is your personal directory; USER, SHELL and LANG describe your session; EDITOR sets your default editor; and PWD/OLDPWD/TMPDIR track directories. Mastering these is the foundation of automation.

## Slide 4. Setting Environment Variables

```slide:content
+----------------------------------------------------------------+
| Setting Environment Variables                                  |
|                                                                |
+----------------------------------------------------------------+
| - Use the export command to set/modify                         |
| - Example: export PATH=$PATH:/new/dir                          |
| - Changes are session-specific by default                      |
| - Persist by adding to ~/.bashrc                               |
| - ...or ~/.bash_profile, ~/.zshrc                              |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ To set or modify an environment variable, we use export. For example, appending a new directory to PATH. Important note: this change only lasts for the current session. If you want it to persist across sessions, add the export line to a shell configuration file such as ~/.bashrc, ~/.bash_profile, or ~/.zshrc.

## Slide 5. Command Line Tools

```slide:content
+----------------------------------------------------------------+
| Command Line Tools                                             |
|                                                                |
+----------------------------------------------------------------+
| - CLI: text-based interaction with the OS                      |
| - Powerful for automation & troubleshooting                    |
| - ls, cd, pwd — navigation                                     |
| - cp, mv, rm, mkdir, touch — file management                   |
| - cat, echo — viewing/printing                                 |
| - find, grep, awk — search & text processing                   |
| - bc — command-line calculator                                 |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Unlike a graphical interface, the command line lets you enter commands directly, which is far more powerful for system management and automation. We use ls, cd and pwd to navigate; cp, mv, rm, mkdir and touch to manage files; cat and echo to view and print text; and find, grep, awk for searching and processing text. bc gives us a simple calculator on the command line.

## Slide 6. Combining Commands

```slide:two-columns
+----------------------------------------------------------------+
| Operators for Combining Commands                               |
|                                                                |
+-----------------------------+----------------------------------+
| - | pipe: output to next    | - &> : redirect stdout and stderr|
|   command's input           | - && : run next only if success  |
| - > : redirect output,      |   (exit 0)                       |
|   overwrite file            | - || : run next only if error    |
| - >> : redirect output,     |   (exit != 0)                    |
|   append to file            | - ; : run commands sequentially  |
| - < : redirect input from a | - $() : capture command output   |
|   file                      |                                  |
| - 2> : redirect stderr to a |                                  |
|   file                      |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ Commands become far more powerful when combined. Pipes send one command's output into another. Redirection operators send output to files, or read input from a file, and let us separate normal output from errors. && and || build conditional chains based on success or failure, and $() lets us capture a command's output for reuse. For example: ls -l | grep \".txt\$\" > txt_files.txt 2> errors.log finds text files and logs errors separately.

## Slide 7. Writing Shell Scripts in Bash

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |             Writing Shell Scripts in Bash              |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Individual commands are useful, but real automation comes from combining them into scripts. Let's look at how a Bash script is structured and run.

## Slide 8. Anatomy of a Script

```slide:content
+----------------------------------------------------------------+
| Anatomy of a Bash Script                                       |
|                                                                |
+----------------------------------------------------------------+
| - A script: text file with commands, vars, logic               |
| - Convention: .sh file extension                               |
| - Must start with a shebang line                               |
| - Shebang for Bash: #!/bin/bash                                |
| - Make executable: chmod +x script.sh                          |
| - Run it: ./script.sh                                          |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ A shell script is just a text file containing a sequence of commands. By convention it uses the .sh extension. The very first line should be the shebang, which tells the system which interpreter to use — for Bash that's #!/bin/bash. Before running it, we make it executable with chmod +x, and then run it with ./script.sh. A simple example script might just echo a greeting and print the current date.

## Slide 9. Variables and Data Types

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                Variables and Data Types                |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Now let's look at how Bash stores and works with data: variable assignment, integers, floating-point numbers, strings, and arrays.

## Slide 10. Declaring Variables

```slide:content
+----------------------------------------------------------------+
| Declaring & Using Variables                                    |
|                                                                |
+----------------------------------------------------------------+
| - Assign directly: name="John"                                 |
| - No spaces around the = sign                                  |
| - Reference with $: echo $name                                 |
| - Curly braces clarify: echo ${name}                           |
| - Recommended inside strings: "${var}"                         |
| - Avoids ambiguity in complex expressions                      |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Variables in Bash are created by simple assignment, with no spaces around the equals sign. To use a variable's value we prefix it with a dollar sign. Curly braces let us clearly delimit the variable name, which becomes important in more complex expressions — this is why it's recommended to always write ${variable} inside strings, to avoid ambiguity.

## Slide 11. Integers

```slide:content
+----------------------------------------------------------------+
| Working with Integers                                          |
|                                                                |
+----------------------------------------------------------------+
| - Bash variables are untyped (strings by default)              |
| - Arithmetic uses double parentheses (( ))                     |
| - num1=10; num2=5                                              |
| - sum=$((num1 + num2))                                         |
| - echo "Sum: ${sum}"  # Sum: 15                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ By default Bash treats everything as a string, but for integer arithmetic we use double parentheses. Here we assign two numbers and compute their sum using $(( )), then print the result with echo.

## Slide 12. Floating-point Numbers

```slide:content
+----------------------------------------------------------------+
| Working with Floating-point Numbers                            |
|                                                                |
+----------------------------------------------------------------+
| - Bash has no native float support                             |
| - Use the external bc calculator instead                       |
| - num1=10.5; num2=5.3                                          |
| - sum=$(echo "${num1} + ${num2}" | bc)                         |
| - echo "Sum: ${sum}"  # Sum: 15.8                              |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Bash cannot do floating-point arithmetic natively. For real numbers we pipe an expression into bc, the command-line calculator, and capture its output with $(). This pattern — building a string expression and piping it to bc — is the standard way to handle decimals in scripts.

## Slide 13. Strings & Quoting

```slide:content
+----------------------------------------------------------------+
| Strings and Quoting                                            |
|                                                                |
+----------------------------------------------------------------+
| - Sequences of characters, single or double quotes             |
| - Single quotes: literal, no interpolation                     |
| - Double quotes: allow variable interpolation                  |
| - greeting="Hello"                                             |
| - echo '${greeting}, World!' -> ${greeting}, World!            |
| - echo "${greeting}, World!" -> Hello, World!                  |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ The choice of quotes matters a lot in Bash. Single quotes preserve the literal text — a variable reference inside them is not expanded. Double quotes, on the other hand, allow variable interpolation and command substitution. This is exactly why we always write our string interpolations with double quotes and curly braces, like "${var}".

## Slide 14. String Manipulation

```slide:two-columns
+----------------------------------------------------------------+
| Built-in String Operations                                     |
|                                                                |
+-----------------------------+----------------------------------+
| - Length: ${#str}           | - Replace first:                 |
| -   str="Hello" -> length 5 |   ${str/pattern/repl}            |
| - Substring:                | -   ${str/World/Bash}            |
|   ${str:start:len}          | - Replace all:                   |
| -   ${str:7:5} -> "World"   |   ${str//pattern/repl}           |
| - No length -> to end:      | - Uppercase: ${str^^}            |
|   ${str:7}                  | - Lowercase: ${str,,}            |
|                             |                                  |
|                             |                                  |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ Bash has several built-in string operations worth knowing: getting the length with ${#str}, extracting a substring by start position and length, replacing the first or all occurrences of a pattern, and converting case with ^^ for uppercase and ,, for lowercase. These come up constantly in text-processing scripts.

## Slide 15. Arrays

```slide:content
+----------------------------------------------------------------+
| Arrays                                                         |
|                                                                |
+----------------------------------------------------------------+
| - Ordered collections, defined with ( )                        |
| - fruits=("apple" "banana" "cherry")                           |
| - Access by index (0-based): ${fruits[0]}                      |
| - All elements: ${fruits[@]}                                   |
| - Size: ${#fruits[@]}                                          |
| - Add by index: fruits[3]="orange"                             |
| - Append: fruits+=("grape" "kiwi")                             |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Arrays let us handle lists — of files, arguments, or command results. We create them with parentheses, access elements by zero-based index, retrieve all elements with ${array[@]}, and get the count with ${#array[@]}. New elements can be added either by assigning to a specific index or with the += operator.

## Slide 16. Conditional Operators and Loops

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |            Conditional Operators and Loops             |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Control flow is what turns a list of commands into real logic. Let's cover comparison operators, if statements, and the three loop types Bash offers.

## Slide 17. Comparison Operators

```slide:two-columns
+----------------------------------------------------------------+
| Numeric, String, File & Logical                                |
|                                                                |
+-----------------------------+----------------------------------+
| - Numeric: -eq -ne -lt -le  | - File: -f file, -d dir, -e      |
|   -gt -ge                   |   exists                         |
| - String: = / == , != , < , | - File: -r readable, -w writable |
|   >                         | - File: -x executable, -s non-   |
| - String empty/non-empty: -z|   empty                          |
|   , -n                      | - Logical: && (AND), || (OR), !  |
| - Quote variables to avoid  |   (NOT)                          |
|   errors                    |                                  |
|                             |                                  |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ Bash groups comparisons into numeric, string, file, and logical operators. Numeric operators like -eq and -lt compare numbers; string operators compare text and check emptiness; file operators test existence, type and permissions; and logical operators combine conditions. A good habit: always quote your variables inside test expressions to avoid errors with empty or spaced values, and use [[ ]] instead of [ ] when comparing strings with < or >.

## Slide 18. if Statement

```slide:content
+----------------------------------------------------------------+
| if / elif / else                                               |
|                                                                |
+----------------------------------------------------------------+
| - if [ condition ]; then ... fi                                |
| - Empty string / 0 is false; else true                         |
| - else branch is optional                                      |
| - elif chains multiple conditions                              |
| - Example: age < 18 -> Minor                                   |
| -          age <= 65 -> Adult                                  |
| -          else -> Senior                                      |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ The if statement is Bash's core branching construct. A condition evaluates to true or false, and else is optional if there's nothing to do on failure. elif lets us chain several conditions in sequence — for example, classifying an age into Minor, Adult, or Senior.

## Slide 19. for Loop

```slide:content
+----------------------------------------------------------------+
| for Loop                                                       |
|                                                                |
+----------------------------------------------------------------+
| - for item in list; do ... done                                |
| - Over a fixed list: apple banana cherry                       |
| - Over a numeric range: {1..5}                                 |
| - Over array indices: "${!array[@]}"                           |
| - Access element: ${array[$index]}                             |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ The for loop iterates over items in a list. That list can be a hard-coded set of words, a numeric range using the {start..end} syntax, or the indices of an array — which lets us print both index and value for each element.

## Slide 20. while & until Loops

```slide:two-columns
+----------------------------------------------------------------+
| while vs until                                                 |
|                                                                |
+-----------------------------+----------------------------------+
| - while [ cond ]; do ...    | - until [ cond ]; do ... done    |
|   done                      | - Runs UNTIL condition becomes   |
| - Runs WHILE condition is   |   true                           |
|   true                      | - count=1                        |
| - count=1                   | - until [ "$count" -gt 5 ]       |
| - while [ "$count" -le 5 ]  | -   echo Count; ((count++))      |
| -   echo Count; ((count++)) |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ while and until are mirror images of each other: while keeps looping as long as the condition is true, until keeps looping as long as the condition is false. Both examples here count from 1 to 5, just expressed with opposite conditions.

## Slide 21. Functions

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                       Functions                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Functions help us structure scripts, avoid duplication, and improve readability. Let's see how to declare and call them, and how parameters work.

## Slide 22. Declaring & Calling Functions

```slide:content
+----------------------------------------------------------------+
| Declaring and Calling Functions                                |
|                                                                |
+----------------------------------------------------------------+
| - function_name() { commands }                                 |
| - or: function function_name { commands }                      |
| - Call: function_name arg1 arg2                                |
| - Params inside: $1 $2 ... , $# , $@                           |
| - Return value via stdout / echo                               |
| - local keyword limits variable scope                          |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ A function is declared with a name followed by parentheses and a block of commands, or with the function keyword. We call it just like any command, passing arguments. Inside, those become positional parameters $1, $2, and so on. Unlike many languages, Bash functions 'return' values by writing to standard output, which we then capture. By default all variables are global even inside functions — the local keyword restricts a variable to the function's own scope.

## Slide 23. Shell Script Parameters

```slide:content
+----------------------------------------------------------------+
| Positional Parameters                                          |
|                                                                |
+----------------------------------------------------------------+
| - $0 : script name                                             |
| - $1, $2, ... : first, second argument                         |
| - $# : number of arguments passed                              |
| - $@ : all arguments, as separate words                        |
| - $* : all arguments, as one string                            |
| - for arg in "$@"; do ... done                                 |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Scripts receive their command-line arguments the same way functions do: through positional parameters. $0 is the script's own name, $1 onward are the actual arguments, $# tells us how many were passed, and $@ versus $* differ in how they expand when quoted — $@ keeps each argument separate, which is almost always what we want when looping.

## Slide 24. Error Handling

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                     Error Handling                     |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Reliable scripts need to handle errors gracefully. Bash gives us a few complementary tools for this.

## Slide 25. Handling Errors in Bash

```slide:content
+----------------------------------------------------------------+
| Exit Codes & Strict Mode                                       |
|                                                                |
+----------------------------------------------------------------+
| - Every command sets $? on exit                                |
| - 0 = success, non-zero = error                                |
| - if [ "$?" -ne 0 ]; then ... fi                               |
| - set -e : stop script on first error                          |
| - set -euo pipefail : strict mode                              |
| -   -u: error on undefined var                                 |
| -   pipefail: catch errors in pipelines                        |
| - cmd && echo ok || echo failed                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Every command leaves behind an exit code in the special variable $?, where 0 means success. We can check it explicitly, or use set -e to abort the whole script on the first failing command. For production scripts, the recommended combination is set -euo pipefail: -e stops on error, -u catches use of undefined variables, and pipefail makes sure a failure anywhere in a pipeline is not silently ignored. The && and || operators also give us a compact conditional chain.

## Slide 26. External Commands & Background Jobs

```slide:content
+----------------------------------------------------------------+
| Calling External Commands & Scripts                            |
|                                                                |
+----------------------------------------------------------------+
| - Call by name + args: command [args]                          |
| - Or another script: ./a_script.sh [args]                      |
| - Runs in a separate process                                   |
| - Capture output: current_date=$(date)                         |
| - Run in background: long_task &                               |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ A Bash script can call other commands or scripts, each running in its own process. We can capture the result of such a call with $(), as we've already seen — for example capturing the current date into a variable. If a task doesn't need to block the rest of the script, we can launch it in the background with the & symbol.

## Slide 27. Examples of Simple Scripts

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |               Examples of Simple Scripts               |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Let's put everything together with four small, complete scripts.

## Slide 28. Example 1: File Backup

```slide:content
+----------------------------------------------------------------+
| Example 1. File Backup                                         |
|                                                                |
+----------------------------------------------------------------+
| - Checks exactly 2 args: source, dest                          |
| - src="$1" ; dest="$2"                                         |
| - cp "${src}" "${dest}"                                        |
| - Checks $? after copying                                      |
| - Prints success or failure message                            |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ This script takes a source and destination file as arguments, checks that exactly two arguments were given, copies the file, and then checks the exit code of cp to report whether the backup succeeded or failed. It's a good first example combining parameters, conditionals and exit-code checking.

## Slide 29. Example 2 vs 3: Counting Lines

```slide:two-columns
+----------------------------------------------------------------+
| Plain Style vs Functional Style                                |
|                                                                |
+-----------------------------+----------------------------------+
| - Example 2: plain script   | - Example 3: functional style    |
| - Checks 1 argument (file)  | - Same logic inside count_lines()|
| - Checks file exists (-f)   | - Uses local for the file param  |
| - lines=$(wc -l < "$file")  | - return 1 on read error         |
| - Checks $? , then prints   | - result=$(count_lines "$1")     |
|   count                     |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ Examples 2 and 3 do exactly the same job — count the lines in a file — but Example 3 moves the core logic into a count_lines function with a local variable and its own return code. This shows how the same script can be made more modular and reusable without changing its behavior.

## Slide 30. Example 4: Merging Files

```slide:content
+----------------------------------------------------------------+
| Example 4. Merging Multiple Text Files                         |
|                                                                |
+----------------------------------------------------------------+
| - Needs at least 2 args (output + inputs)                      |
| - output_file="$1" ; shift                                     |
| - cat "$@" > "${output_file}"                                  |
| - shift drops $1, leaving input files in $@                    |
| - Checks $? for success/failure message                        |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ This script merges any number of input files into one output file. The first argument is the destination; shift removes it from the argument list, so $@ now holds only the input files, which we feed straight into cat with output redirected to the destination file.

## Slide 31. Bibliography

```slide:content
+----------------------------------------------------------------+
| Bibliography                                                   |
|                                                                |
+----------------------------------------------------------------+
| - Parker S., Shell Scripting Tutorial                          |
| - Cooper M., Advanced Bash-Scripting Guide, 2014               |
| - Garrels M., Bash Guide for Beginners, 2008                   |
| - Shotts W., The Linux Command Line                            |
| - GNU Bash Manual                                              |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ For further reading, here are five solid references: the Shell Scripting Tutorial, the Advanced Bash-Scripting Guide, the Bash Guide for Beginners, The Linux Command Line book, and of course the official GNU Bash Manual for the full reference.

## Slide 32. Thank You

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
|   |                                             Questions? |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Thank you for your attention. That covers the basics of scripting in Bash — environment, variables, control flow, functions, error handling, and worked examples. I'm happy to take any questions now.
