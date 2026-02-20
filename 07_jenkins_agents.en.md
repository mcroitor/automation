# Jenkins Agents

- [Jenkins Agents](#jenkins-agents)
  - [Types of Jenkins Agents](#types-of-jenkins-agents)
    - [Permanent Agents](#permanent-agents)
    - [Dynamic Agents](#dynamic-agents)
  - [Setting up a Permanent Agent via SSH](#setting-up-a-permanent-agent-via-ssh)
    - [Step 1: Preparing the Agent](#step-1-preparing-the-agent)
    - [Step 2: Creating the Jenkins User](#step-2-creating-the-jenkins-user)
    - [Step 3: Configuring in Jenkins Web UI](#step-3-configuring-in-jenkins-web-ui)
    - [Step 4: Adding SSH credentials](#step-4-adding-ssh-credentials)
    - [Recommendations for managing workspace](#recommendations-for-managing-workspace)
  - [Setting up Docker Agents](#setting-up-docker-agents)
    - [Setting up Docker Host](#setting-up-docker-host)
    - [Step 1: Installing Docker Plugin](#step-1-installing-docker-plugin)
    - [Step 2: Configuring Docker Cloud](#step-2-configuring-docker-cloud)
    - [Step 3: Creating a Docker Template](#step-3-creating-a-docker-template)
    - [Step 4: Example of using dynamic Docker agents](#step-4-example-of-using-dynamic-docker-agents)
  - [Best Practices for Scaling](#best-practices-for-scaling)
  - [Bibliography](#bibliography)

## Types of Jenkins Agents

Jenkins agents are separate machines or containers that execute build tasks, running alongside or instead of the Jenkins controller node. It is not recommended to run builds directly on the controller node for security and performance reasons.

By default, Jenkins installation creates one built-in agent that runs on the same server as the Jenkins controller. However, for security and reliability reasons, it is recommended to disable the built-in agent and use dedicated agents for executing build tasks.

Jenkins offers the following types of agents:

- Permanent Agents
- Dynamic Agents (On-Demand Agents)

### Permanent Agents

**Permanent Agents** are servers that are always running and connected to the Jenkins controller. They can be physical servers, virtual machines, or containers configured to execute build tasks.

**Advantages:**

- Predictable performance
- Customized configuration
- Fast build start (no time spent on agent startup and setup)

**Disadvantages:**

- Require constant resources to operate
- Manual management and maintenance
- Limited scalability

### Dynamic Agents

**Dynamic Agents** are agents created on demand. They can be implemented using cloud providers, containers, or orchestrators such as Kubernetes.

**Advantages:**

- Efficient resource utilization
- Easily scalable
- Automatic lifecycle management

**Disadvantages:**

- More complex setup
- Potential delays in agent provisioning  

## Setting up a Permanent Agent via SSH

Communication between the Jenkins controller and a permanent agent can be done using the JNLP protocol or SSH. For Unix-like systems, SSH is commonly used.

To set up a permanent agent via SSH, the target machine must have an SSH server and Java Development Kit (JDK) installed.

### Step 1: Preparing the Agent

On the target machine, ensure that Java and the SSH server are installed. For example, on Ubuntu/Debian:

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install openjdk-17-jdk-headless openssh-server
```

For CentOS/RHEL:

```bash
# CentOS/RHEL
sudo yum install java-17-openjdk-headless openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
```

### Step 2: Creating the Jenkins User

For security reasons, it is recommended to create a separate user for the Jenkins agent and set up SSH keys for passwordless authentication.

```bash
# Creating the user
sudo useradd -m -s /bin/bash jenkins

# Creating SSH key for connection
sudo -u jenkins ssh-keygen -t rsa -b 4096 -f /home/jenkins/.ssh/jenkins_key

# Setting up authorized keys
sudo -u jenkins cp /home/jenkins/.ssh/jenkins_key.pub /home/jenkins/.ssh/authorized_keys
sudo -u jenkins chmod 600 /home/jenkins/.ssh/authorized_keys
```

### Step 3: Configuring in Jenkins Web UI

1. Go to `Manage Jenkins > Manage Nodes and Clouds`
2. Click `New Node`
3. Fill in the parameters:
   - **Name**: `static-agent-01`
   - **Type**: `Permanent Agent`
   - **Number of executors**: `2` (number of parallel tasks)
   - **Remote root directory**: `/home/jenkins/workspace`
   - **Labels**: `static-agent`
   - **Usage**: `Use this node as much as possible`
   - **Launch method**: `Launch agents via SSH`
   - **Host**: IP address or hostname of the agent
   - **Credentials**: add the SSH key from step 2

### Step 4: Adding SSH credentials

1. In the Credentials section, click `Add`
2. Select `SSH Username with private key`
3. Fill in:
   - **Username**: `jenkins`
   - **Private Key**: copy the contents of `/home/jenkins/.ssh/jenkins_key`
   - **ID**: `jenkins-ssh-key`
   - **Description**: `Jenkins SSH Key for Static Agents`

Example of using a permanent agent in Jenkinsfile:

```groovy
// Using a permanent agent
pipeline {
    agent {
        label 'static-agent'
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building on static agent: ${NODE_NAME}"'
                sh 'make build'
            }
        }
    }
}
```

### Recommendations for managing workspace

Permanent agents accumulate build files in work directories, which can lead to disk space issues and conflicts between builds. Therefore, it is recommended to regularly clean the workspace.

**Cleaning workspace after build:**

```groovy
pipeline {
    agent { label 'static-agent' }
    stages {
        stage('Build') {
            steps {
                sh 'make build'
            }
        }
    }
    post {
        always {
            cleanWs()  // Cleaning after completion (success or failure)
        }
    }
}
```

## Setting up Docker Agents

Docker-based agents allow Jenkins to dynamically create containers for executing build tasks and immediately remove them after completion.

There are three different ways to integrate Docker with Jenkins:

- Using Docker in Docker (DinD);
- Connecting to a remote Docker host via TCP;
- Using the Docker host socket (`unix:///var/run/docker.sock`) if Jenkins is running inside a container.

Connecting to a remote Docker host via TCP is the most versatile method, as it allows isolating Jenkins from the Docker host (Jenkins and Docker can run on different machines).

### Setting up Docker Host

To connect Jenkins to a Docker host via TCP, you need to configure the Docker daemon to listen for TCP connections.

> [!WARNING]
> Using the Docker API over TCP without TLS (port 2375) exposes full Docker access to anyone with network access. This is a critical security vulnerability! For production environments, always use TLS (port 2376) or restrict access via firewall to trusted IP addresses.

For test environments on a Windows machine, you need to go to Docker Desktop settings and enable the option "`Expose daemon on tcp://localhost:2375 without TLS`". In this case, you will be able to manage Docker on the host at `tcp://localhost:2375` without using TLS.

Linux users can change the Docker daemon configuration. For systemd-based systems, create or edit the file `/etc/systemd/system/docker.service.d/override.conf`:

```ini
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
```

Or use the `/etc/docker/daemon.json` file (requires modification of the systemd unit):

```json
{
  "hosts": ["tcp://0.0.0.0:2375"]
}
```

After making changes, you need to restart the Docker service:

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

### Step 1: Installing Docker Plugin

1. Go to `Manage Jenkins > Manage Plugins`
2. Find and install `Docker Plugin`
3. Restart Jenkins

### Step 2: Configuring Docker Cloud

1. Go to `Manage Jenkins > Manage Nodes and Clouds > Configure Clouds`
2. Click `Add a new cloud` and select `Docker`
3. Fill in the settings:
   - **Name**: `docker-cloud`
   - **Docker Host URI**: `tcp://host.docker.internal:2375`
   - **Enabled**: check the box

The address `host.docker.internal` is used to access the Docker host from containers. However, you can also use the actual IP address or hostname of the Docker host.

### Step 3: Creating a Docker Template

In the Docker Agent templates section, add a new template:

- **Labels**: `docker-agent`
- **Name**: `docker-agent-{0}`
- **Docker Image**: `jenkins/agent:latest`
- **Instance Capacity**: `10`
- **Remote File System Root**: `/home/jenkins/agent`
- **Connect Method**: `Attach Docker container` (or `Connect with SSH` depending on the image)

Any image used as a base for a Jenkins agent must have a JRE installed and the necessary build tools. However, the choice of connection method to the agent also determines the need to install additional dependencies. For example, if connecting via JNLP, the image must have the JNLP agent installed. For a base image, you can use the official Jenkins images:

- `jenkins/ssh-agent` — for SSH connection.
- `jenkins/inbound-agent` — for JNLP connection.
- `jenkins/agent` — base image, usually used for direct connection via Docker API.

However, these images do not contain build tools (Maven, Node.js, Docker CLI, etc.), so for real tasks it is recommended to use your own images based on these base images with pre-installed necessary tools or use images from Docker Hub that already contain the required tools.

### Step 4: Example of using dynamic Docker agents

```groovy
// Using a specific Docker agent
pipeline {
    agent {
        label 'docker-agent'
    }
    stages {
        stage('Hello World') {
            steps {
                sh 'echo "Hello from Docker Agent: ${NODE_NAME}"'
            }
        }
    }
}
```

## Best Practices for Scaling

- **Use dynamic agents** for most builds. Dynamic agents allow for efficient resource utilization.
- **Reserve permanent agents** for critical or long-running tasks, such as integration tests.
- **Configure auto-scaling policies** based on queue length. This helps automatically scale the number of agents according to the load.
- **Monitor agent usage** and optimize their count.
- **Use labels** for different types of builds (Maven, Node.js, Docker).
- **Set resource limits** to prevent agent overload.

## Bibliography

1. Humble, Jez; Farley, David. **Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation** - Addison-Wesley Professional, 2010.
   - The fundamental work on continuous delivery and pipeline optimization
2. [Jenkins Documentation - Distributed Builds](https://www.jenkins.io/doc/book/scaling/)
   - Official documentation on Jenkins scaling
3. [Jenkins Docker Plugin](https://plugins.jenkins.io/docker-plugin/)
   - Documentation for the Docker plugin for Jenkins
