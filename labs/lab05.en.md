# IW05: Ansible Playbook for Server Configuration

## Objective

Learn to create Ansible playbooks for automating server configuration.

## Prerequisites

This assignment builds upon Individual Work IW04.

Create a `lab05` folder in your GitHub repository to store all files related to this individual work. You must have Docker and Docker Compose installed to complete this assignment. You should also have a repository with a PHP project containing unit tests, as in Individual Work IW04.

Copy files from the previous individual work `lab04` to the `lab05` folder.

This assignment also includes descriptions of steps from previous individual works marked as "Review".

## Assignment

Create a `compose.yaml` file.

### 1. Installing and Configuring Jenkins

[!INFO] Review

Jenkins will be used to manage all automation stages.

Create a "jenkins-controller" service in the `compose.yaml` file. Launch the Jenkins Controller container using Docker Compose and configure it following the on-screen instructions. Install the necessary plugins: Docker, Docker Pipeline, GitHub Integration, SSH Agent.

### 2. Setting Up SSH Agent

[!INFO] Review

The SSH agent will be used by Jenkins for building the PHP project and running unit tests.

Create a `Dockerfile.ssh_agent` file for the SSH agent. Install necessary packages (PHP-CLI and possibly other dependencies). Create SSH keys for Jenkins integration with the SSH agent and configure Jenkins to use these keys.

Add an "ssh-agent" service to `compose.yaml` using the created Dockerfile.

### 3. Creating Ansible Agent

The Ansible agent will be used by Jenkins to execute Ansible playbooks that will configure the test server.

Create a `Dockerfile.ansible_agent` file for the Ansible agent based on Ubuntu. In this file, install Ansible and necessary dependencies.

Create SSH keys for Jenkins integration with the Ansible agent and configure Jenkins to use these keys.

Create SSH keys for connecting the Ansible agent to the test server and configure Ansible to use these keys. Connection to the test server should be performed as the `ansible` user.

Add an "ansible-agent" service to `compose.yaml` using the created Dockerfile.

### 4. Creating Test Server

The test server will represent a testing environment that will be configured using Ansible playbooks and within which the PHP application functionality will be tested.

Create a `Dockerfile.test_server` file with test server configuration based on Ubuntu. In this file, install openssh-server and configure it to work with SSH keys.

Create an `ansible` user on the test server and configure SSH for connecting to the server as this user using the previously created SSH keys.

### 5. Creating Ansible Playbook for Test Server Configuration

Create an `ansible` folder. In this folder, define an inventory file `hosts.ini` where you specify connection parameters to the test server.

Create an Ansible playbook `setup_test_server.yml` that will perform the following tasks on the test server:

1. Installing and configuring Apache2.
2. Installing and configuring PHP and necessary extensions.
3. Configuring Apache virtual host for the PHP project.

### 6. Pipeline for Building and Testing PHP Project

[!INFO] Review

Create a `pipelines` folder in the `lab05` folder.

Create a Jenkins pipeline for building and testing the PHP project using the SSH agent. For this, create a `php_build_and_test_pipeline.groovy` file in the `pipelines` folder.

The pipeline should include the following stages:

1. Cloning the repository with the PHP project.
2. Installing project dependencies using Composer.
3. Running unit tests using PHPUnit.
4. Reporting test results.

### 7. Pipeline for Test Server Configuration Using Ansible

Create a Jenkins pipeline for configuring the test server using the Ansible agent. For this, create an `ansible_setup_pipeline.groovy` file in the `pipelines` folder.

The pipeline should include the following stages:

1. Cloning the repository with the Ansible playbook.
2. Executing the Ansible playbook for test server configuration.

### 8. Pipeline for Deploying PHP Project to Test Server

Create a Jenkins pipeline for deploying the PHP project to the test server. For this, create a `php_deploy_pipeline.groovy` file in the `pipelines` folder.

The pipeline should include the following stages:

1. Cloning the repository with the PHP project.
2. Copying project files to the test server.
3. Configuring the project on the test server (if necessary).

Deployment of project code to the test server can be performed using Ansible.

### 9. Testing the Deployed PHP Project

Open a web browser and navigate to the test server address to ensure that the PHP project is successfully deployed and working correctly.

### Report Preparation

Create a `readme.md` file in the `lab05` folder of your GitHub repository. In the report, describe the following aspects:

1. Project description.
2. Steps for configuring Jenkins Controller.
3. Steps for setting up SSH agent.
4. Steps for creating and configuring Ansible agent.
5. Steps for creating the test server.
6. Description of Ansible playbook and its tasks.
7. Steps for creating Jenkins pipelines for building and testing PHP project, configuring test server, and deploying PHP project.
8. Answer the questions:
    - What are the advantages of using Ansible for server configuration?
    - What other Ansible modules exist for configuration management?
    - What problems did you encounter when creating the Ansible playbook and how did you solve them?

## Submission

Upload the project to a GitHub repository and provide a link to it.

## Grading

| Criterion                                                 | No  | Partially | Yes  |
| --------------------------------------------------------- | --- | --------- | ---- |
| Created `compose.yaml` file with required services        | 0   | 5         | 10   |
| Created Ansible playbook for test server configuration    | 0   | 10        | 20   |
| Created Jenkins pipeline for building and testing project | 0   | 5         | 10   |
| Created Jenkins pipeline for test server configuration    | 0   | 10        | 20   |
| Created Jenkins pipeline for PHP project deployment       | 0   | 10        | 20   |
| Work execution description in report                      | 0   | 5         | 10   |
| Answers to questions in report                            | 0   | 5         | 10   |
| Each day of delay                                         | 0   | 0         | -20  |
| Plagiarism                                                | 0   | -50       | -100 |
| **Total**                                                 |     |           | 100  |
