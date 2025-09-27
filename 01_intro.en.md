# Introduction to Automation

- [Introduction to Automation](#introduction-to-automation)
  - [What is Automation?](#what-is-automation)
  - [Areas of Automation Application](#areas-of-automation-application)
  - [Advantages of Automation](#advantages-of-automation)
  - [Overview of Scripting Languages](#overview-of-scripting-languages)
  - [Automation Tools](#automation-tools)
  - [Conclusion](#conclusion)
  - [Bibliography](#bibliography)

> Our wizards, — he continued, — create automated systems that allow them to conduct complex experiments and observations without being physically present.
>
> __A. and B. Strugatsky, *Monday Begins on Saturday*__

## What is Automation?

Automation is the use of technology to perform tasks with minimal human intervention in order to replace or augment human labor [^1]. In practice, this means creating scripts or programs that execute repetitive operations, streamline complex workflows, and improve overall efficiency. Automation is not limited to a single domain; it is a foundational approach that can be applied wherever routine or precision is required.

> [!NOTE]
> At one time, a story was published on a cult site in Runet [^2]:
>
> *xxx: We had YYY (a build engineer) lured here. The guy lived strictly in the console and vim, drew diagrams with scripts in dot, wrote docs in wiki markdown, if something required more than 1.5 minutes he wrote a script. We're sitting here sorting out his legacy.*
>
> *xxx: Some of the highlights*
>
> *xxx: `smack-my-bitch-up.sh` - sends a text message "late at work" to his wife (apparently). Automatically picks reasons from an array of strings, randomly. Runs inside a cron-job. The job fires if there are active SSH-sessions on the server after 9pm with his login.*
>
> *xxx: `kumar-asshole.sh` - scans the inbox for emails from "Kumar" (a DBA at our clients). Looks for keywords like "help", "trouble", "sorry" etc. If keywords are found - the script SSHes into the clients server and rolls back the staging database to the latest backup. Then sends a reply "no worries mate, be careful next time".*
>
> *xxx: `hangover.sh` - another cron-job that is set to specific dates. Sends automated emails like "not feeling well/gonna work from home" etc. Adds a random "reason" from another predefined array of strings. Fires if there are no interactive sessions on the server at 8:45am.*
>
> *xxx: (the first prize) `fuckingcoffee.sh` - this one waits exactly 17 seconds (!), then opens an SSH session to our coffee-machine (we had no frikin idea the coffee machine is on the network, runs linux and has SSHD up and running) and sends some weird gibberish to it. Looks binary. Turns out this thing starts brewing a mid-sized half-caf latte and waits another 24 (!) seconds before pouring it into a cup. The timing is exactly how long it takes to walk to the machine from the dudes desk.*

The need for automation typically arises when a sequence of actions must be performed regularly, with accuracy, or at scale. In both everyday and industrial contexts, automation can be found in a wide range of processes, such as:

- Making a cup of espresso
- Preparing a pizza
- Manufacturing plastic bottles
- Launching a space rocket
- Collecting data and preparing it for analysis
- Building, testing, and deploying software

In most cases, automation is implemented by writing *automation scripts* (or simply *scripts*) in interpreted languages. These scripts are small programs designed to perform specific tasks, such as managing system resources, processing files, or interacting with web services. Throughout this text, the terms *automation script* and *script* are used interchangeably. In addition to scripts, specialized tools and frameworks are often employed to provide higher-level abstractions and to manage more complex or large-scale automation tasks.

## Areas of Automation Application

Automation in IT spans a variety of domains, each with its own set of requirements and benefits. Key areas include:

- DevOps: deploying and maintaining infrastructure
- Testing: automating tests and ensuring software quality
- Business processes: automating document flow and project management
- Data analysis: automating data collection and processing
- System administration: automating routine tasks and user management

## Advantages of Automation

The primary motivation for automation is to ensure that processes are executed consistently, accurately, and efficiently, especially when dealing with repetitive or large-scale tasks. By delegating such operations to automated systems, organizations and individuals can achieve:

- Increased efficiency and productivity
- Reduced human error
- Lower operational costs
- Improved consistency and quality

Consequently, automation becomes a critical component in the development and maintenance of modern systems and workflows.

## Overview of Scripting Languages

Scripting languages are essential tools for implementing automation. They are designed for integration, flexibility, and ease of use, making them ideal for automating a wide range of tasks. Commonly used scripting languages include:

- __CMD__ – command-line scripting language for Windows
- __Bash__ – Unix shell and command language
- __PowerShell__ – task automation framework for Windows, capable of using .NET libraries and cmdlets
- __Python__ – high-level programming language known for its readability
- __JavaScript__ – widely used in web development and increasingly in automation and cloud environments

While these languages are popular choices, any interpreted language can be used to develop automation scripts, depending on the requirements of the task.

## Automation Tools

In addition to scripting languages, a variety of automation tools are available to further simplify and extend automation capabilities. These tools provide user-friendly interfaces, advanced features, and integration with other systems. Notable examples include:

- __Ansible__ – IT automation tool that uses YAML to describe tasks and processes
- __Jenkins__ – continuous integration and delivery tool for automating the building, testing, and deployment of software
- __GitHub Actions__ – workflow automation platform built into GitHub for managing automation scripts in repositories
- __Terraform__ – infrastructure as code tool for defining and provisioning infrastructure using configuration files

## Conclusion

This course provides a comprehensive introduction to automation, focusing on practical skills and real-world applications. You will learn to use __Bash__ and __PowerShell__ for writing automation scripts, __GitHub Actions__ for automating workflows in repositories, and __Jenkins__ for automating software build and deployment processes. By the end of the course, you will be equipped with the knowledge and tools necessary to design, implement, and manage automation solutions in a variety of IT contexts. The primary operating system for practical assignments will be Linux (Ubuntu / Debian).

## Bibliography

1. [What is Automation?](https://www.ibm.com/topics/automation)
2. [цитата 436725, bash.org](https://башорг.рф/quote/436725)
3. [Now that's what I call a hacker](https://www.jitbit.com/alexblog/249-now-thats-what-i-call-a-hacker)
