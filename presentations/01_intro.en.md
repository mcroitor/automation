# Introduction to Automation

## Slide 0. Introduction to Automation

```slide:title
+----------------------------------------------------------------+
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                     Introduction to Automation                 |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
|                                                                |
|                                                                |
|                                                 Automation     |
|                                                 and Scripting  |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Welcome to the course "Automation and Scripting". This first lesson is an introduction to automation: what it is, where it is applied, why it matters, and the languages and tools we will use throughout the course.

## Slide 1. What is Automation?

```slide:content
+----------------------------------------------------------------+
| What is Automation?                                            |
|                                                                |
+----------------------------------------------------------------+
| Definition: technology performing tasks with minimal           |
|   human intervention.                                          |
|                                                                |
| In practice: scripts and programs that run repetitive          |
|   operations.                                                  |
|                                                                |
| Goal: streamline workflows and improve efficiency.             |
|                                                                |
| Scope: any domain where routine or precision is required.      |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Automation is the use of technology to perform tasks with minimal human intervention, in order to replace or augment human labor. In practice, this means writing scripts or programs that execute repetitive operations, streamline complex workflows, and improve overall efficiency. It is not limited to one domain — it is a foundational approach applicable wherever routine or precision is required.

## Slide 2. Where Automation Arises

```slide:content
+----------------------------------------------------------------+
| Where Automation Arises                                        |
|                                                                |
+----------------------------------------------------------------+
| The need appears when actions must be:                         |
|                                                                |
| - performed regularly                                          |
| - performed with accuracy                                      |
| - performed at scale                                           |
|                                                                |
| Examples:                                                      |
| - making espresso, preparing a pizza                           |
| - manufacturing bottles, launching a rocket                    |
| - collecting data, building and deploying software             |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ The need for automation typically arises when a sequence of actions must be performed regularly, with accuracy, or at scale. You will find it in everyday and industrial contexts alike: making a cup of espresso, preparing a pizza, manufacturing plastic bottles, launching a space rocket, collecting data for analysis, and building, testing, and deploying software.

## Slide 3. Automation in Practice

```slide:content
+----------------------------------------------------------------+
| Automation in Practice                                         |
|                                                                |
+----------------------------------------------------------------+
| Most automation is implemented with:                           |
|                                                                |
| - automation scripts (small programs for specific tasks)       |
| - written in interpreted languages                             |
|                                                                |
| Scripts can:                                                   |
| - manage system resources                                      |
| - process files                                                |
| - interact with web services                                   |
|                                                                |
| Specialized tools add higher-level abstractions.               |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ In most cases, automation is implemented by writing automation scripts in interpreted languages. These are small programs designed to perform specific tasks such as managing system resources, processing files, or interacting with web services. Throughout this course, "automation script" and "script" are used interchangeably. Beyond scripts, specialized tools and frameworks provide higher-level abstractions for more complex, large-scale automation.

## Slide 4. Areas of Automation Application

```slide:two-columns
+----------------------------------------------------------------+
| Areas of Automation Application                                |
|                                                                |
+-----------------------------+----------------------------------+
| - DevOps: deploy and        | - Data analysis: automate        |
|   maintain infrastructure   |   collection and processing      |
| - Testing: automate tests   | - System administration:         |
|   and ensure quality        |   routine tasks, user mgmt       |
| - Business processes:       |                                  |
|   document flow, PM         |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
|                             |                                  |
+-----------------------------+----------------------------------+
```

__Comment:__ Automation in IT spans a variety of domains, each with its own requirements and benefits. Key areas include DevOps for deploying and maintaining infrastructure, testing for automating tests and ensuring software quality, business processes for automating document flow and project management, data analysis for automating data collection and processing, and system administration for automating routine tasks and user management.

## Slide 5. Advantages of Automation

```slide:content
+----------------------------------------------------------------+
| Advantages of Automation                                       |
|                                                                |
+----------------------------------------------------------------+
| Motivation: consistent, accurate, efficient execution.         |
|                                                                |
| Benefits:                                                      |
| - increased efficiency and productivity                        |
| - reduced human error                                          |
| - lower operational costs                                      |
| - improved consistency and quality                             |
|                                                                |
| Result: a critical component of modern systems and workflows.  |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ The primary motivation for automation is to ensure that processes are executed consistently, accurately, and efficiently, especially for repetitive or large-scale tasks. By delegating such operations to automated systems, organizations and individuals achieve increased efficiency and productivity, reduced human error, lower operational costs, and improved consistency and quality. Consequently, automation becomes a critical component in developing and maintaining modern systems and workflows.

## Slide 6. Overview of Scripting Languages

```slide:content
+----------------------------------------------------------------+
| Overview of Scripting Languages                                |
|                                                                |
+----------------------------------------------------------------+
| Designed for integration, flexibility, and ease of use.        |
|                                                                |
| - CMD: command-line scripting for Windows                      |
| - Bash: Unix shell and command language                        |
| - PowerShell: Windows automation, .NET libraries, cmdlets      |
| - Python: high-level, known for readability                    |
| - JavaScript: web development and cloud automation             |
|                                                                |
| Any interpreted language can be used for automation.           |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ Scripting languages are essential tools for implementing automation. They are designed for integration, flexibility, and ease of use. Commonly used languages include CMD for Windows command-line scripting, Bash as the Unix shell, PowerShell as a Windows automation framework that can use .NET libraries and cmdlets, Python for its readability, and JavaScript which is widely used in web development and increasingly in automation and cloud environments. While these are popular choices, any interpreted language can be used depending on the task.

## Slide 7. Automation Tools

```slide:content
+----------------------------------------------------------------+
| Automation Tools                                               |
|                                                                |
+----------------------------------------------------------------+
| Provide interfaces, advanced features, and integration.        |
|                                                                |
| - Ansible: IT automation using YAML                            |
| - Jenkins: CI/CD for build, test, deploy                       |
| - GitHub Actions: workflow automation in repositories          |
| - Terraform: infrastructure as code                            |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ In addition to scripting languages, a variety of automation tools simplify and extend automation capabilities. Notable examples include Ansible, an IT automation tool that uses YAML to describe tasks; Jenkins, a continuous integration and delivery tool for automating the building, testing, and deployment of software; GitHub Actions, a workflow automation platform built into GitHub; and Terraform, an infrastructure-as-code tool for defining and provisioning infrastructure using configuration files.

## Slide 8. What You Will Learn

```slide:content
+----------------------------------------------------------------+
| What You Will Learn                                            |
|                                                                |
+----------------------------------------------------------------+
| A practical, real-world introduction to automation.            |
|                                                                |
| - Bash and Python for automation scripts                       |
| - Jenkins for build and deployment automation                  |
| - Kibana / Grafana for monitoring                              |
|                                                                |
| Primary OS for practical work: Linux (Ubuntu / Debian).        |
|                                                                |
|                                                                |
|                                                                |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ This course provides a comprehensive introduction to automation, focusing on practical skills and real-world applications. You will learn to use Bash and PowerShell for writing automation scripts, GitHub Actions for automating workflows in repositories, and Jenkins for automating software build and deployment processes. By the end of the course, you will be equipped to design, implement, and manage automation solutions in a variety of IT contexts. The primary operating system for practical assignments will be Linux, specifically Ubuntu or Debian.

## Slide 9. Thank You

```slide:section
+----------------------------------------------------------------+
|                                                                |
|   +--------------------------------------------------------+   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                    Thank You                           |   |
|   |                                                        |   |
|   |                                                        |   |
|   |                                                        |   |
|   +--------------------------------------------------------+   |
|   |                                             Questions? |   |
|   +--------------------------------------------------------+   |
|                                                                |
+----------------------------------------------------------------+
```

__Comment:__ That concludes our introduction to automation. Thank you for your attention — I would be happy to take any questions.
