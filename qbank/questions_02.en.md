# Questions on "Scripting Fundamentals"

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
