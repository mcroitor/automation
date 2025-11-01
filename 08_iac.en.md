# Infrastructure as Code (IaC)

- [Infrastructure as Code (IaC)](#infrastructure-as-code-iac)
  - [Introduction to IaC](#introduction-to-iac)
  - [Tools and Technologies](#tools-and-technologies)
    - [Types of IaC Tasks](#types-of-iac-tasks)
    - [Choosing an IaC Tool](#choosing-an-iac-tool)
    - [Ansible](#ansible)
      - [Installing and Configuring Ansible](#installing-and-configuring-ansible)
      - [Playbook Basics](#playbook-basics)
      - [Some Useful Ansible Modules](#some-useful-ansible-modules)
    - [Terraform](#terraform)
      - [Core Terraform Concepts](#core-terraform-concepts)
      - [Installing and Configuring Terraform](#installing-and-configuring-terraform)
      - [HashiCorp Configuration Language](#hashicorp-configuration-language)
      - [Practical Terraform Examples](#practical-terraform-examples)
        - [Example 1: Creating a Virtual Machine in AWS](#example-1-creating-a-virtual-machine-in-aws)
        - [Example 2: Using Variables and Modules](#example-2-using-variables-and-modules)
      - [Basic Terraform Commands](#basic-terraform-commands)
  - [IaC Best Practices](#iac-best-practices)
    - [Code Management and Versioning](#code-management-and-versioning)
    - [Security](#security)
    - [Modularity and Reusability](#modularity-and-reusability)
    - [Testing](#testing)
    - [Environment Management](#environment-management)
    - [Monitoring and Logging](#monitoring-and-logging)
    - [Performance and Optimization](#performance-and-optimization)
    - [Documentation and Communication](#documentation-and-communication)
    - [Continuous Integration/Continuous Deployment](#continuous-integrationcontinuous-deployment)
    - [Compliance and Auditing](#compliance-and-auditing)
  - [Bibliography](#bibliography)
    - [Official Documentation](#official-documentation)
    - [Books and Learning Materials](#books-and-learning-materials)
    - [Articles and Research](#articles-and-research)
    - [Tools and Extensions](#tools-and-extensions)
    - [Communities and Resources](#communities-and-resources)
  - [Glossary](#glossary)

## Introduction to IaC

**Infrastructure as Code** (IaC) is the practice of managing and provisioning computing resources through machine-readable configuration files, rather than through physical hardware or interactive management tools. IaC enables automation of infrastructure deployment and management processes, leading to increased efficiency, reduced errors, and improved consistency.

Infrastructure as Code is a key component of modern DevOps methodologies and Continuous Integration/Continuous Deployment (CI/CD). With IaC, teams can quickly create, modify, and delete infrastructure, enabling faster response to changing business requirements. Another important property of IaC is repeatability: the same configuration can be used to create identical environments, simplifying application testing and deployment.

The core concepts of IaC include:

- **Declarative vs. Imperative Approach**: In the declarative approach, the desired state of infrastructure is described, and the system determines how to achieve it. In the imperative approach, specific steps are specified to reach the desired state.
- **Version Control**: IaC configuration files can be stored in version control systems, enabling change tracking and rollback to previous versions when necessary.
- **Automation**: Infrastructure deployment and management processes are automated using scripts and tools, reducing the likelihood of human errors.
- **Repeatability**: The ability to create identical environments for development, testing, and production.
- **Single Source of Truth**: Configuration files serve as the single source of truth for the entire infrastructure.

Consequently, IaC provides the following benefits:

- **Speed and Efficiency**: Rapid infrastructure deployment and modification.
- **Error Reduction**: Automation reduces the likelihood of human errors in infrastructure deployment and management. Additionally, configuration versioning requires testing and review of changes, further reducing risks.
- **Consistency**: Ensuring identical configurations across different environments.

The process of creating and configuring infrastructure resources is called **Provisioning** — creating virtual machines, networks, storage, databases, etc., in cloud or physical environments. In the context of IaC, provisioning includes automatic infrastructure creation based on declarative configuration files.

## Tools and Technologies

The IaC ecosystem includes numerous tools and technologies that help implement infrastructure as code principles. Some of the most popular include:

- **Ansible**: An automation tool that enables configuration management and application deployment. It uses a declarative approach based on YAML for describing configurations.
- **Terraform**: A tool for creating, modifying, and managing infrastructure using a declarative configuration language. It supports multiple cloud service providers and enables resource management across various environments.
- **Puppet**: A configuration management tool that automates infrastructure deployment and management. It uses its own configuration description language and supports both declarative and imperative approaches.
- **Chef**: Another configuration management tool that uses Ruby for infrastructure description. It automates deployment and resource management processes.
- **CloudFormation**: An Amazon Web Services service that enables creating and managing AWS resources using JSON or YAML templates.

### Types of IaC Tasks

The Infrastructure as Code ecosystem distinguishes between two main types of tasks:

1. **Infrastructure Provisioning** — creating and managing infrastructure resources:
   - Creating virtual machines and containers
   - Configuring network infrastructure (VPC, subnets, routing)
   - Creating data storage and databases
   - Configuring load balancers
   - Managing DNS records
   - Creating security policies and IAM roles

2. **Configuration Management** — configuring software and services on already created resources:
   - Installing and configuring operating systems
   - Installing applications and services
   - Configuring configuration files
   - Managing users and access permissions
   - Setting up monitoring and logging
   - Applying security updates

### Choosing an IaC Tool

| Criteria | Terraform | Ansible | CloudFormation | Puppet |
|----------|-----------|---------|----------------|---------|
| **Task Type** | Provisioning | Configuration | Provisioning | Configuration |
| **Cloud Support** | Multi-cloud | Limited | AWS only | Limited |
| **Learning Curve** | Medium | Low | Medium | High |
| **State Management** | Yes | No | Yes | No |
| **Agents** | No | No | No | Yes |
| **Idempotency** | Yes | Yes | Yes | Yes |

### Ansible

As mentioned, Ansible is a powerful tool for automating configuration management and application deployment. It uses simple and understandable YAML language for describing tasks and configurations, making it accessible to a wide range of users. Ansible operates on a "push" principle, meaning commands are sent from the control node to target nodes. Ansible supports numerous modules for managing various infrastructure aspects, including software installation, user management, and network parameter configuration. The main difference between Ansible and its alternatives is that no agent or client installation is required on target systems. Interaction with target nodes occurs via SSH (or WinRM for Windows).

Ansible configuration files are called "playbooks" and contain descriptions of the system resource states they should be in at a specific moment, including installed packages, running services, created files, and much more. Ansible verifies that each system resource is in the expected state and attempts to correct the resource state if it doesn't match expectations.

For task execution, Ansible uses a module system consisting of small scripts that perform specific actions on target nodes. Ansible modules cover a wide range of tasks, including package management, network device configuration, database operations, and much more. Ansible also supports inventory, which allows defining target node groups and managing them centrally.

#### Installing and Configuring Ansible

Most Linux and macOS systems support Ansible installation through package managers. For example, on Ubuntu, you can install Ansible using the following command:

```bash
sudo apt-get update
sudo apt-get install ansible
```

After installing Ansible, you need to configure an **inventory file** — a file (or set of files) listing target nodes (hosts) and their groups (i.e., computers that Ansible should manage). Example of a simple inventory file:

```ini
[webservers]
web1.example.com
web2.example.com
[dbservers]
db1.example.com
```

By default, the inventory file is located at `/etc/ansible/hosts`, but you can specify another file using the `-i` parameter when running Ansible commands.

By default, Ansible has two groups: `all` and `ungrouped`. The first includes all hosts, and the second includes hosts that don't belong to any groups.

Ansible settings can be changed in a configuration file.

The Ansible configuration file can be stored in different locations (files listed in order of decreasing priority):

- `ANSIBLE_CONFIG` (environment variable)
- `ansible.cfg` (in current directory)
- `~/.ansible.cfg` (in user's home directory)
- `/etc/ansible/ansible.cfg`

Ansible searches for the configuration file in the specified order and uses the first one found (configurations from different files are not merged).

For working in the current directory, you can create an inventory file `hosts.ini`:

```ini
[webservers]
web1.example.com
web2.example.com
[dbservers]
db1.example.com
```

and a configuration file `ansible.cfg` with minimal settings:

```ini
# ansible.cfg
[defaults]
inventory = ./hosts.ini
host_key_checking = False
```

#### Playbook Basics

An Ansible playbook is a YAML file containing a set of instructions (plays) describing what tasks need to be performed on target nodes. Each playbook consists of one or more plays that define which hosts will be affected and what tasks will be executed.

- `play` — a set of tasks to be executed for a group of hosts
- `task` — a specific task that includes at least:
  - description (task name is optional but highly recommended)
  - module and command (action in the module)

Example of a simple playbook that installs and starts Apache web server on the `webservers` group and installs and starts MySQL database server on the `dbservers` group:

```yaml
---

- name: Install and start Apache on web servers
  hosts: webservers
  become: yes

  tasks:
    - name: Install Apache
      apt:
        name: apache2
        state: present
        update_cache: yes

    - name: Start and enable Apache service
      service:
        name: apache2
        state: started
        enabled: yes

- name: Install and start MySQL on database servers
  hosts: dbservers
  become: yes
  
  tasks:
    - name: Install MySQL
      apt:
        name: mysql-server
        state: present
        update_cache: yes
        
    - name: Start and enable MySQL service
      service:
        name: mysql
        state: started
        enabled: yes
```

To execute a playbook, use the `ansible-playbook` command:

```bash
ansible-playbook playbook.yml
```

#### Some Useful Ansible Modules

- `apt` - manages packages on Debian/Ubuntu-based systems
- `yum` - manages packages on RedHat/CentOS-based systems
- `service` - manages services (start, stop, restart)
- `copy` - copies files to target nodes
- `template` - manages configuration file templates
- `command` - executes commands on target nodes
- `shell` - executes shell commands on target nodes

### Terraform

**Terraform** is a tool for creating, modifying, and managing infrastructure using a declarative configuration language. It allows describing infrastructure as code and managing it with simple commands.

Terraform supports multiple cloud service providers, enabling resource management across various environments, including AWS, Azure, and Google Cloud.

#### Core Terraform Concepts

Terraform is based on the following key concepts:

- **Providers**: Terraform providers are plugins that enable interaction with various cloud platforms and services. Each provider offers a set of resources and data that can be used in Terraform configurations.
- **Resources**: Resources are the basic building blocks of infrastructure in Terraform. They represent objects such as virtual machines, networks, databases, and other components that can be created and managed with Terraform.
- **Configuration Files**: Terraform configurations are written in files with `.tf` extension and use the declarative HashiCorp Configuration Language (HCL). These files describe the desired state of infrastructure.
- **State**: Terraform stores the current infrastructure state in a state file (usually `terraform.tfstate`). This file is used to track changes and determine which resources need to be created, modified, or deleted when executing Terraform commands.

#### Installing and Configuring Terraform

Terraform can be installed by downloading the binary file from the official website and adding it to the system PATH. For example, on Linux, you can execute the following commands:

```bash
wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
unzip terraform_1.0.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```

#### HashiCorp Configuration Language

HCL (HashiCorp Configuration Language) is a declarative configuration language used in Terraform for infrastructure description. HCL is designed to be easily readable and understandable for both humans and machines.

HCL allows describing resources and their properties using simple and clear syntax. Therefore, the main configuration element in HCL is the resource block, which defines the resource type and its parameters.

The Terraform language operates with the following main constructs:

- **Block** — a data container describing some aspect of infrastructure (resource, provider, variable, etc.)
- **Attribute** — a key-value pair inside a block defining resource or configuration properties
- **Variable** — a parameter that can be used to pass values to Terraform configuration
- **Expression** — a combination of literals, variables, and functions that evaluates to a value

Block description in HCL looks as follows:

```hcl
<block_type> "<block_name>" {
  <attribute_key> = <attribute_value>
  ...
}
```

#### Practical Terraform Examples

##### Example 1: Creating a Virtual Machine in AWS

Let's consider a simple example of creating a virtual machine (EC2 instance) in Amazon Web Services:

```hcl
# main.tf
# AWS provider configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider configuration
provider "aws" {
  region = "us-west-2"
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main-vpc"
  }
}

# Create subnet
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "main-subnet"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# Create route table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "main-rt"
  }
}

# Associate subnet with route table
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# Security group
resource "aws_security_group" "web" {
  name        = "web-security-group"
  description = "Security group for web server"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

# EC2 instance
resource "aws_instance" "web" {
  ami                    = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2
  instance_type          = "t2.micro"
  key_name              = "my-key-pair"
  vpc_security_group_ids = [aws_security_group.web.id]
  subnet_id             = aws_subnet.main.id

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from Terraform!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web-server"
  }
}

# Output public IP address
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}
```

##### Example 2: Using Variables and Modules

Creating a variables file (`variables.tf`):

```hcl
# variables.tf
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-project"
}
```

Using variables in the main configuration file:

```hcl
# main.tf using variables
provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = {
    Name        = "${var.project_name}-${var.environment}-web"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Get latest Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
```

Variable values file (`terraform.tfvars`):

```hcl
# terraform.tfvars
region        = "eu-west-1"
instance_type = "t3.small"
environment   = "production"
project_name  = "webapp"
```

#### Basic Terraform Commands

The following basic commands are used to work with Terraform:

- **terraform init**: Project initialization (provider download)
- **terraform validate**: Configuration validation
- **terraform fmt**: Code formatting
  - **terraform fmt -recursive**: Recursive formatting of all files in directory
- **terraform plan**: Planning changes
- **terraform apply**: Applying changes
- **terraform refresh**: Refreshing resource state
- **terraform show**: Viewing current state
  - **terraform show -json**: Output state in JSON format
  - **terraform show `<plan-file>`**: View planned changes from plan file
- **terraform import**: Import existing resources to Terraform state
- **terraform state**: State management
  - **terraform state list**: View list of resources in state
  - **terraform state show `<resource>`**: View details of specific resource
- **terraform destroy**: Delete entire infrastructure

To learn more about Terraform commands, you can run `terraform --help` from the command line.

## IaC Best Practices

Infrastructure as Code requires adherence to certain best practices to ensure efficiency, security, and manageability. Below are detailed recommendations for successful IaC implementation:

### Code Management and Versioning

- **Use Version Control Systems**: Store all configuration files in version control systems like Git to track changes and enable collaboration.
  - Use meaningful commit messages
  - Apply conventional commits for structured change history
  - Create tags for infrastructure releases
- **Repository Structure**: Organize IaC code into logical directory structure:
  
  ```text
  infrastructure/
  ├── environments/
  │   ├── dev/
  │   ├── staging/
  │   └── prod/
  ├── modules/
  │   ├── network/
  │   ├── compute/
  │   └── database/
  ├── shared/
  │   ├── variables.tf
  │   └── outputs.tf
  └── README.md
  ```

- **Branching and Workflow**: Use Git Flow or GitHub Flow for change management:
  - Feature branches for new functionality
  - Pull/Merge requests for code review
  - Protected branches for production environment

### Security

- **Secret Management**: Never store secrets in configuration files:
  - Use environment variables
  - Apply external secret management systems (HashiCorp Vault, AWS Secrets Manager)
  - Use .gitignore to exclude files with sensitive data
- **Principle of Least Privilege**: Configure access based on minimum required permissions:
  - Use IAM roles instead of users
  - Regularly audit access rights
  - Apply temporary access tokens
- **Security Scanning**: Integrate security scanning tools:
  - Checkov for Terraform static analysis
  - tfsec for configuration security checks
  - KICS for comprehensive IaC analysis

### Modularity and Reusability

- **Create Modules**: Divide configurations into reusable modules:
  - One module = one logical function
  - Clearly defined input and output parameters
  - Module versioning

- **DRY Principle**: Avoid code duplication:
  - Use variables for repeating values
  - Create shared modules for common components
  - Apply data sources to retrieve existing resources

### Testing

- **Multi-level Testing**: Implement testing at different levels:
  - **Syntax Testing**: `terraform validate`, `ansible-lint`
  - **Static Analysis**: Terratest, Kitchen-Terraform
  - **Integration Testing**: Deployment in test environment
  - **End-to-end Testing**: Application functionality verification

- **Test Automation**: Integrate tests into CI/CD pipeline:
  
  ```yaml
  # Example GitHub Actions workflow
  name: IaC Testing
  on: [push, pull_request]
  jobs:
    test:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v2
        - name: Terraform Format Check
          run: terraform fmt -check
        - name: Terraform Validation
          run: terraform validate
        - name: Security Scan
          run: checkov -d .
  ```

### Environment Management

- **Environment Separation**: Maintain separate configurations for different environments:
  - Use Terraform workspaces or separate directories
  - Apply different variables for each environment
  - Isolate state between environments
- **Gradual Deployment**: Apply changes incrementally:
  - First in dev/staging environment
  - Then in production with blue-green or canary deployments
  - Use approval gates for critical changes

### Monitoring and Logging

- **Change Tracking**: Maintain audit of all infrastructure changes:
  - Log all terraform apply operations
  - Slack/Teams notifications about changes
  - Dashboards for infrastructure state monitoring
- **Drift Detection**: Detect discrepancies between code and actual state:
  - Regular `terraform plan` runs
  - Automatic drift notifications
  - Tools like Driftctl for comprehensive analysis

### Performance and Optimization

- **Parallelization**: Optimize IaC operation execution:
  - Use terraform parallelism flag
  - Split large configurations into independent parts
  - Apply partial configurations for large projects
- **State Management**: Efficiently manage Terraform state:
  - Use remote backend (S3, Consul, Terraform Cloud)
  - Enable state locking to prevent conflicts
  - Regularly backup state
  - Consider splitting state into logical components

### Documentation and Communication

- **Comprehensive Documentation**: Document everything:
  - README files for each module and project
  - Architectural diagrams
  - Runbooks for operational procedures
  - Changelog for tracking changes
- **Code Comments**: Comment complex logic:
  
  ```hcl
  # Create dedicated subnet for database tier
  # with restricted access only from app tier
  resource "aws_subnet" "database" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    
    tags = {
      Name = "${var.project}-database-subnet"
      Tier = "database"
    }
  }
  ```

- **Naming Standards**: Use consistent standards:
  - Kebab-case for resources: `web-server-sg`
  - Snake_case for variables: `instance_type`
  - Prefixes for grouping: `${var.project}-${var.environment}-resource`

### Continuous Integration/Continuous Deployment

- **Pipeline Integration**: Integrate IaC into CI/CD processes:
  - Automatic plan on pull requests
  - Automatic apply on merge to main
  - Rollback mechanisms on errors
- **Approval Workflows**: Implement approval processes:
  - Manual approval for production deployments
  - Automated approval for development environments
  - Multi-stage approvals for critical changes

### Compliance and Auditing

- **Policy as Code**: Implement policies through code:
  - Open Policy Agent (OPA) for Terraform
  - AWS Config Rules
  - Azure Policy
  - Sentinel for Terraform Enterprise
- **Compliance Monitoring**: Regularly check compliance:
  - Automatic compliance scans
  - Compliance reports for standards (SOC2, PCI DSS)
  - Remediation plans for violations

## Bibliography

### Official Documentation

1. **Terraform Documentation** — [https://www.terraform.io/docs](https://www.terraform.io/docs)
2. **Ansible Documentation** — [https://docs.ansible.com/](https://docs.ansible.com/)
3. **AWS CloudFormation User Guide** — [https://docs.aws.amazon.com/cloudformation/](https://docs.aws.amazon.com/cloudformation/)
4. **Azure Resource Manager Templates** — [https://docs.microsoft.com/azure/azure-resource-manager/](https://docs.microsoft.com/azure/azure-resource-manager/)
5. **Google Cloud Deployment Manager** — [https://cloud.google.com/deployment-manager/docs](https://cloud.google.com/deployment-manager/docs)

### Books and Learning Materials

1. **Morris, Kief** — "Infrastructure as Code: Managing Servers in the Cloud" (O'Reilly Media, 2020)
2. **Poulton, Nigel** — "The Terraform Book" (2021)
3. **Heap, Tim** — "Ansible for DevOps: Server and configuration management for humans" (2020)
4. **Sato, Yevgeniy** — "Terraform: Up and Running: Writing Infrastructure as Code" (O'Reilly Media, 2019)
5. **Kim, Gene; Humble, Jez; Debois, Patrick; Willis, John** — "The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations" (IT Revolution Press, 2016)

### Articles and Research

1. **HashiCorp** — "Infrastructure as Code in a Private or Public Cloud" — [https://www.hashicorp.com/resources/what-is-infrastructure-as-code](https://www.hashicorp.com/resources/what-is-infrastructure-as-code)
2. **Amazon Web Services** — "Infrastructure as Code Best Practices" — [https://aws.amazon.com/blogs/devops/infrastructure-as-code-best-practices/](https://aws.amazon.com/blogs/devops/infrastructure-as-code-best-practices/)
3. **Red Hat** — "What is infrastructure as code (IaC)?" — [https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac)
4. **Microsoft Azure** — "Infrastructure as code (IaC) best practices" — [https://docs.microsoft.com/azure/devops/learn/what-is-infrastructure-as-code](https://docs.microsoft.com/azure/devops/learn/what-is-infrastructure-as-code)
5. **Google Cloud** — "Infrastructure as Code on Google Cloud" — [https://cloud.google.com/architecture/infrastructure-as-code](https://cloud.google.com/architecture/infrastructure-as-code)

### Tools and Extensions

1. **Terratest** — Framework for testing infrastructure code — [https://terratest.gruntwork.io/](https://terratest.gruntwork.io/)
2. **Checkov** — Static analysis for Terraform, CloudFormation and other IaC tools — [https://www.checkov.io/](https://www.checkov.io/)
3. **TFLint** — Linter for Terraform — [https://github.com/terraform-linters/tflint](https://github.com/terraform-linters/tflint)
4. **Ansible Lint** — Tool for checking Ansible playbooks — [https://ansible-lint.readthedocs.io/](https://ansible-lint.readthedocs.io/)
5. **Kitchen-Terraform** — Framework for Terraform integration testing — [https://newcontext-oss.github.io/kitchen-terraform/](https://newcontext-oss.github.io/kitchen-terraform/)

### Communities and Resources

1. **HashiCorp Learn** — [https://learn.hashicorp.com/](https://learn.hashicorp.com/)
2. **Terraform Community** — [https://discuss.hashicorp.com/c/terraform-core/](https://discuss.hashicorp.com/c/terraform-core/)
3. **Ansible Community** — [https://www.ansible.com/community](https://www.ansible.com/community)
4. **DevOps.org** — [https://devops.org/](https://devops.org/)
5. **Infrastructure as Code Slack Community** — [https://infrastructureascode.slack.com/](https://infrastructureascode.slack.com/)

## Glossary

**Ansible** — automation tool for configuration management, application deployment, and task orchestration. Uses declarative approach and YAML files.

**Backend** — in Terraform context, the mechanism for storing state files. Can be local (default) or remote (S3, Consul, Terraform Cloud).

**Blue-Green Deployment** — deployment strategy where two identical production environments (blue and green) are maintained, with switching between them ensuring safe deployment.

**CI/CD (Continuous Integration/Continuous Deployment)** — development methodology including automatic code change integration and deployment to production environment.

**CloudFormation** — Amazon Web Services service for infrastructure management using JSON or YAML templates.

**Compliance** — conformance to established standards, rules, and requirements (e.g., SOC2, PCI DSS, GDPR).

**Declarative Approach** — method of describing infrastructure where the desired end state is specified, and the system determines how to achieve it.

**DevOps** — culture and practices combining development and operations to accelerate and improve software delivery quality.

**Drift Detection** — process of detecting discrepancies between infrastructure description in code and actual resource state.

**DRY (Don't Repeat Yourself)** — programming principle meaning avoidance of code duplication by creating reusable components.

**HCL (HashiCorp Configuration Language)** — declarative configuration language used in Terraform for infrastructure description.

**IaC (Infrastructure as Code)** — practice of managing and provisioning computing resources through machine-readable configuration files.

**Idempotency** — property of an operation where repeated execution doesn't change the result after first application.

**Imperative Approach** — method of describing infrastructure where specific steps are specified to achieve the desired state.

**Inventory File** — file in Ansible containing list of target hosts and their grouping for management.

**Module** — in Terraform, reusable set of configurations; in Ansible, component for executing specific tasks on target host.

**Playbook** — YAML file in Ansible containing set of instructions (plays) for executing tasks on target nodes.

**Policy as Code** — practice of defining and managing security and compliance policies through code (e.g., using Open Policy Agent).

**Provider** — in Terraform, plugin that enables interaction with specific cloud platform or service (AWS, Azure, GCP, etc.).

**Provisioning** — process of automatically creating and configuring infrastructure resources (virtual machines, networks, storage, databases) in cloud or physical environment using code.

**Play** — in Ansible, set of tasks executed for a specific group of hosts.

**Resource** — in Terraform, basic infrastructure building block (virtual machine, network, database, etc.).

**State Locking** — mechanism in Terraform to prevent simultaneous state modification by multiple users.

**Terraform** — tool for creating, modifying, and managing infrastructure using HCL declarative configuration language.

**Workspace** — in Terraform, mechanism for managing multiple instances of one configuration (e.g., for different environments).

**YAML (YAML Ain't Markup Language)** — human-readable data serialization format used in Ansible, CloudFormation, and other IaC tools.
