# Questions on "Infrastructure as Code (IaC)"

## Knowledge

1. What is Infrastructure as Code (IaC)?
    - [x] The practice of managing infrastructure through configuration files
    - [ ] A tool for automatically writing application code in different languages
    - [ ] A method of physically configuring servers in a data center manually
    - [ ] A set of scripts written by developers outside of working hours

2. Which approach describes the desired state of the infrastructure, and the system itself determines how to achieve it?
   - [x] Declarative
   - [ ] Imperative
   - [ ] Procedural
   - [ ] Object-oriented

3. Which IaC tool uses YAML language and works without agents on target systems?
    - [x] Ansible
    - [ ] Terraform
    - [ ] Puppet
    - [ ] Chef

4. Which language is used in Terraform to describe infrastructure?
   - [x] HCL
   - [ ] YAML
   - [ ] JSON
   - [ ] Ruby

5. What is idempotence in the context of IaC?
   - [x] A property of an operation where repeated execution does not change the result
   - [ ] The ability of a system to scale horizontally under increased resource load
   - [ ] The ability to safely roll back infrastructure changes without data loss or service disruption
   - [ ] The practice of automatic configuration backup for system recovery after failure

6. What does the DRY principle mean in the context of IaC?
   - [x] Don't Repeat Yourself
   - [ ] Do Repeat Yourself
   - [ ] Data Redundancy Yield
   - [ ] Dynamic Resource Yield

7. What is "drift detection" in IaC?
   - [x] Detecting discrepancies between the code and the actual state of resources
   - [ ] Automatic scaling of resources based on current load
   - [ ] Backup of infrastructure configurations for recovery in case of failure
   - [ ] Monitoring performance and availability of servers in real-time

8. What type of tasks does Ansible primarily perform?
   - [x] Configuration management
   - [ ] Infrastructure provisioning
   - [ ] Resource monitoring
   - [ ] Backup

9. What is a "resource" in Terraform?
   - [x] The basic building block of infrastructure
   - [ ] Any data file used in the project
   - [ ] CLI command
   - [ ] Cloud service provider

10. Deployment strategy where two identical production environments are maintained, switching between which ensures safe deployment:
    - [x] Blue-Green Deployment
    - [ ] Canary Deployment
    - [ ] Rolling Update
    - [ ] Immutable Infrastructure

11. Ansible file containing a list of target hosts and their grouping for management:
    - [x] Inventory
    - [ ] Playbook
    - [ ] Role
    - [ ] Module

12. What is provisioning in the context of IaC?
    - [x] Automatic creation and configuration of infrastructure resources
    - [ ] Monitoring the current state of servers and cloud resources
    - [ ] Backup of data and system configurations
    - [ ] Managing user accounts and access rights

13. What is a Terraform state file?
    - [x] A file containing information about the current state of the managed infrastructure
    - [ ] A file with environment variables for running Terraform commands
    - [ ] A log file with all executed Terraform operations
    - [ ] A configuration file with settings for cloud service providers

14. What does the `terraform plan` command do?
    - [x] Shows the changes that will be applied without executing them
    - [ ] Applies all changes to the infrastructure immediately
    - [ ] Creates a backup of the current state of the infrastructure
    - [ ] Deletes all resources defined in the configuration

15. What is a Terraform provider?
    - [x] A plugin for interacting with a specific platform or service
    - [ ] A company providing cloud services for infrastructure deployment
    - [ ] A file describing all project resources
    - [ ] A command to apply changes to the infrastructure

16. What is an Ansible playbook?
    - [x] A YAML file describing tasks to be executed on hosts
    - [ ] A list of all available Ansible modules for automation
    - [ ] An inventory file with a list of target hosts
    - [ ] A log of all Ansible operations executed on hosts

17. What is an Ansible role?
    - [x] A reusable set of tasks, files, and variables for a specific purpose
    - [ ] User access rights to target servers
    - [ ] A type of module for working with databases
    - [ ] A group of hosts in the inventory file for task execution

18. Where is the infrastructure state stored by default in Terraform?
    - [x] In the local file `terraform.tfstate`
    - [ ] In a remote S3 bucket
    - [ ] In the memory of the Terraform process
    - [ ] In a PostgreSQL database

19. What is a Terraform module?
    - [x] A reusable container for multiple resources in a project
    - [ ] A separate provider for working with a cloud platform
    - [ ] A command to initialize a new Terraform project
    - [ ] A state file with all created resources

20. What is the principle behind immutable infrastructure?
    - [x] Replacing servers instead of modifying them during updates
    - [ ] Regularly updating servers in place without rebooting
    - [ ] Using a single server for all development environments
    - [ ] Keeping old versions of servers for rollback purposes

21. What is GitOps in the context of infrastructure management?
    - [x] Using Git as the single source of truth for infrastructure
    - [ ] A tool for automatically committing infrastructure changes to a repository
    - [ ] A method of backing up configurations to a Git repository
    - [ ] The practice of storing application source code together with infrastructure

22. Which command initializes a new Terraform project?
    - [x] `terraform init`
    - [ ] `terraform start`
    - [ ] `terraform create`
    - [ ] `terraform new`

23. What is an Ansible module?
    - [x] A ready-to-use block of code for performing a specific task
    - [ ] A file with variables for use in a playbook
    - [ ] A group of hosts in the inventory file
    - [ ] A YAML file describing a sequence of tasks

24. What is the advantage of versioning IaC code?
    - [x] The ability to track infrastructure changes and roll back to previous versions
    - [ ] Automatic creation of backups for all servers
    - [ ] Faster deployment of new application versions
    - [ ] Automatic installation of security updates on servers

## Usage

1. The deployment strategy where two identical production environments are maintained, switching between which ensures safe deployment.
    - Blue-Green Deployment
    - blue-green deployment
2. The process of detecting discrepancies between the infrastructure described in code and the actual state of resources.
    - Drift Detection
3. A programming principle that means avoiding code duplication by creating reusable components.
    - Don't Repeat Yourself
    - DRY
4. Which command is used to run the Ansible playbook `configure.yml`?
    - ansible-playbook configure.yml
5. What is the name of the file in Ansible that contains a list of target hosts and their grouping for management?
    - Inventory
    - inventory
6. Which command in Terraform can be used to view planned changes before applying them?
    - terraform plan
7. Which command in Terraform can be used to initialize a new project and download the necessary providers?
    - terraform init
8. Which command in Terraform can be used to apply the planned changes to the infrastructure?
    - terraform apply