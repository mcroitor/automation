# Jenkins

- [Jenkins](#jenkins)
  - [Jenkins Installation](#jenkins-installation)
  - [Jenkins Configuration](#jenkins-configuration)
  - [Plugin Management](#plugin-management)
  - [Jenkinsfile](#jenkinsfile)
    - [Declarative Syntax](#declarative-syntax)
    - [Scripted Syntax](#scripted-syntax)
  - [Jenkinsfile Programming Fundamentals](#jenkinsfile-programming-fundamentals)
    - [Variables and Data Types](#variables-and-data-types)
    - [Basic Constructs](#basic-constructs)
      - [Conditional Constructs](#conditional-constructs)
      - [Loops](#loops)
    - [Function Declaration](#function-declaration)
    - [Built-in Commands and Functions](#built-in-commands-and-functions)
  - [Jenkins Pipeline Creation Fundamentals](#jenkins-pipeline-creation-fundamentals)
    - [Working with Environment Variables](#working-with-environment-variables)
    - [Build Parameterization](#build-parameterization)
    - [Error Handling and Fault Tolerance](#error-handling-and-fault-tolerance)
  - [Simple Jenkinsfile Example](#simple-jenkinsfile-example)
  - [Conclusion](#conclusion)
  - [Bibliography](#bibliography)

The Jenkins automation system is widely used for implementing Continuous Integration and Delivery (CI/CD) processes. It allows automating the building, testing, and deployment of applications, ensuring fast and reliable software delivery.

Jenkins operates as a distributed system consisting of a **controller** (main server) and **agents** (execution nodes). The controller manages tasks, distributes them among agents, and collects results. Agents execute tasks such as code building, test execution, and application deployment. Agents can be either dynamic (created on demand) or static (permanently available). Dynamic agents include, for example, Docker containers that are launched and destroyed as needed.

## Jenkins Installation

Jenkins can be installed on various operating systems, including Windows, macOS, and Linux. Minimum hardware requirements for Jenkins installation:

- Processor: 2 CPU (4+ CPU cores are recommended)
- RAM: 256 MB (4+ GB is recommended)
- Disk space: 1 GB (50+ GB is recommended)

Installation on Linux (Ubuntu example):

```bash
sudo apt update
sudo apt install fontconfig openjdk-21-jre
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins
```

There is also an option to run Jenkins in a Docker container, which simplifies the installation and configuration process. When running Jenkins in Docker, an additional 10 GB is recommended.

Example of running Jenkins via Docker:

```bash
docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

It should be noted that port 50000 is used for communication between the Jenkins controller and agents. To preserve Jenkins data, you need to use a volume mounted at `/var/jenkins_home`.

> [!NOTE]
> It is not recommended to mount a local directory to `/var/jenkins_home`, as this can lead to permission and file system compatibility issues.

For ease of working with Jenkins in Docker, you can use `docker-compose`. Example `docker-compose.yml` file for running Jenkins:

```yaml
services:
  jenkins:
    image: jenkins/jenkins:lts
    restart: on-failure
    ports:
      - "8080:8080"
      - "50000:50000"
    volumes:
      - jenkins_home:/var/jenkins_home
  ssh-agent:
    image: jenkins/ssh-agent

volumes:
  jenkins_home:
```

In this case, an additional `ssh-agent` service is created, which runs an SSH server. It allows connecting to other servers via SSH, which is useful for performing tasks that require remote access.

## Jenkins Configuration

After installing Jenkins, you need to perform initial configuration. To do this, open a web browser and go to `http://localhost:8080`. You will be prompted to enter the installation password, which can be found in the `/var/jenkins_home/secrets/initialAdminPassword` file inside the Jenkins container. When running Jenkins in Docker, this password will be available in the container logs.

After entering the password, you will be prompted to install recommended plugins and create the first administrator. By default, Jenkins includes basic capabilities for working with Git and Java; other integrations can be added as needed.

The initial Jenkins installation in Docker will include working with Java and Node.js; for other programming languages, you need to add build and testing tools. To do this, you need to define your own Dockerfile with the necessary tools and use it as the image for Jenkins.

Example Dockerfile for Jenkins with Python support:

```Dockerfile
FROM jenkins/jenkins:lts
USER root

RUN apt-get update && apt-get install -y python3 python3-pip

USER jenkins
```

However, it is simpler and more efficient to build applications in separate containers and use Jenkins only for orchestrating CI/CD processes.

## Plugin Management

Plugins extend Jenkins capabilities and allow integration with various tools and services. Plugin management is performed through the web interface in the "Manage Jenkins" → "Plugins" section.

Jenkins has many plugins, but for a basic CI/CD process, it is recommended to install the following:

- **Git** — work with Git repositories
- **Pipeline** — support for pipelines as code
- **Docker Pipeline** — Docker integration
- **NodeJS** — Node.js environment management and build support
- **JUnit** — test result publishing

For integration with external systems, it is recommended to install:

- **GitHub** — GitHub integration (webhooks, statuses)
- **GitLab** — GitLab integration
- **Slack Notification** — Slack notifications
- **Email Extension** — extended email capabilities

Finally, for code quality analysis, it is useful to install:

- **SonarQube Scanner** — code quality analysis
- **HTML Publisher** — HTML format report publishing
- **Cobertura** — code coverage reports

Additionally, you can install the **Blue Ocean** plugin, which provides a modern interface for pipeline visualization and simplifies their creation and management (note: Blue Ocean was deprecated by Jenkins in 2023 and is no longer actively maintained).

## Jenkinsfile

A `Jenkinsfile` is a text file that contains all the stages and steps of your pipeline. It can be created in the root of your project and should be added to version control. A `Jenkinsfile` is written in the Groovy language and supports two types of syntax: declarative and scripted.

### Declarative Syntax

With declarative syntax, a `Jenkinsfile` has the following structure:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Build steps
            }
        }
        stage('Test') {
            steps {
                // Testing steps
            }
        }
        stage('Deploy') {
            steps {
                // Deployment steps
            }
        }
    }
    post {
        always {
            // Actions that are always performed after pipeline completion
        }
        success {
            // Actions on successful completion
        }
        failure {
            // Actions on failure
        }
    }
}
```

In this example:

- `pipeline` — root block defining the pipeline;
- `agent any` — indicates that the pipeline can run on any available Jenkins agent;
- `stages` — block containing all pipeline stages;
- `stage('Stage Name')` — defines a separate stage with a name;
- `steps` — block containing specific steps to be executed at this stage;
- `post` — block defining actions to be performed after pipeline completion, depending on its result.

### Scripted Syntax

Scripted syntax provides greater programming flexibility but requires deep knowledge of the Groovy language.

```groovy
node {
    stage('Build') {
        // Build steps
    }
    stage('Test') {
        // Testing steps
    }
    stage('Deploy') {
        // Deployment steps
    }
}
```

Declarative syntax is simpler and more structured, making it easier to read and maintain.

## Jenkinsfile Programming Fundamentals

In the Groovy language, you can define variables, use conditional constructs, loops, custom functions, and much more, allowing you to create complex and flexible pipelines.

### Variables and Data Types

To define variables, use the `def` keyword:

```groovy
def myVariable = "Hello, Jenkins!"
```

Data types in Groovy include:

- Numbers (integers and floating-point);
- Strings;
- Boolean values (true/false);
- Lists (array analogs);
- Maps (dictionary or object analogs);
- Classes.

### Basic Constructs

#### Conditional Constructs

As in many programming languages, Groovy uses conditional constructs to perform different actions depending on conditions.

```groovy
if (env.BRANCH_NAME == 'main') {
    sh 'echo "Deploying to production"'
} else {
    sh 'echo "Deploying to staging"'
}
```

You can also use `switch` constructs for multiple choice:

```groovy
switch (env.BRANCH_NAME) {
    case 'main':
        sh 'echo "Deploying to production"'
        break
    case 'develop':
        sh 'echo "Deploying to staging"'
        break
    default:
        sh 'echo "Deploying to test environment"'
}
```

#### Loops

Various types of loops are available in Groovy, such as `for`, `while`, and `each`.

Example using a `for` loop:

```groovy
def environments = ['dev', 'staging', 'prod']
for (env in environments) {
    sh "echo Deploying to ${env}"
}
```

The same example using the `each` method:

```groovy
def environments = ['dev', 'staging', 'prod']
environments.each { env ->
    sh "echo Deploying to ${env}"
}
```

And, accordingly, a `while` loop:

```groovy
def environments = ['dev', 'staging', 'prod']
def index = 0
while (index < environments.size()) {
    def env = environments[index]
    sh "echo Deploying to ${env}"
    index++
}
```

### Function Declaration

Functions in Groovy are declared using the `def` keyword:

```groovy
def logString(logType, message) {
    return "[${logType}] ${message}"
}
echo logString('INFO', 'Pipeline started')
echo logString 'ERROR', 'Pipeline failed'
```

### Built-in Commands and Functions

Jenkins provides many built-in commands and functions for performing various tasks in pipelines:

- `sh 'command'` — execute shell command on agent (for Linux);
- `bat 'command'` — execute command line on agent (for Windows);
- `checkout scm` — check out source code from version control system;
- `archiveArtifacts 'path'` — archive artifacts for later use;
- `junit 'path'` — publish test results in JUnit format;
- `mail to: 'email', subject: 'subject', body: 'body'` — send email notification;
- `docker.build('image-name')` — build Docker image;
- `docker.image('image-name').run()` — run container from Docker image;

## Jenkins Pipeline Creation Fundamentals

After studying Groovy syntax and basic language constructs, let's examine key aspects of creating practical pipelines in Jenkins. This knowledge will help create flexible and reliable CI/CD processes for real projects.

### Working with Environment Variables

Jenkins provides many built-in environment variables that contain useful information about the current build. Additionally, you can define your own variables through the `environment` block.

```groovy
pipeline {
    agent any
    environment {
        MY_VAR = 'custom_value'
        NODE_VERSION = '21'
    }
}
```

Environment variables can be accessed using the `env` object.

**Main built-in variables:**

- `env.BRANCH_NAME` — current branch name (available only for multibranch projects)
- `env.BUILD_NUMBER` — current build number  
- `env.BUILD_URL` — URL to the current build
- `env.WORKSPACE` — path to working directory
- `env.JOB_NAME` — Jenkins job name

Example of using environment variables:

```groovy
pipeline {
    agent any
    environment {
        // Custom environment variables
        MY_VAR = 'custom_value'
        NODE_VERSION = '21'
    }
    stages {
        stage('Environment Info') {
            steps {
                sh 'echo "Branch: ${env.BRANCH_NAME}"'
                sh 'echo "Build number: ${env.BUILD_NUMBER}"'
                sh 'echo "Build URL: ${env.BUILD_URL}"'
                sh 'echo "Workspace: ${env.WORKSPACE}"'
                sh 'echo "Node version: ${env.NODE_VERSION}"'
            }
        }
    }
}
```

### Build Parameterization

Parameters allow creating interactive builds where the user can set values during launch. This is especially useful for deploying to different environments or controlling pipeline behavior.

**Parameter types:**

- `choice` — selection from a predefined list
- `booleanParam` — true/false flag  
- `string` — text field
- `password` — hidden text field

```groovy
pipeline {
    agent any
    parameters {
        choice(
            name: 'ENVIRONMENT', 
            choices: ['dev', 'staging', 'prod'], 
            description: 'Target environment for deployment'
        )
        booleanParam(
            name: 'SKIP_TESTS', 
            defaultValue: false, 
            description: 'Skip test execution'
        )
        string(
            name: 'VERSION', 
            defaultValue: '1.0.0', 
            description: 'Version for deployment'
        )
    }
    stages {
        stage('Deploy') {
            steps {
                script {
                    // Using parameters in pipeline logic
                    if (!params.SKIP_TESTS) {
                        sh 'npm test'
                    }
                    sh "echo Deploying version ${params.VERSION} to ${params.ENVIRONMENT}"
                }
            }
        }
    }
}
```

### Error Handling and Fault Tolerance

Proper error handling is critically important for stable CI/CD pipeline operation. Jenkins provides several mechanisms for execution control and failure response.

**Main approaches:**

- `try-catch` blocks for local error handling
- `post` section for actions after stage completion
- Build status management through `currentBuild.result`

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    try {
                        sh 'npm run build'
                        echo "Build completed successfully"
                    } catch (Exception e) {
                        echo "Build failed: ${e.getMessage()}"
                        // Set build status
                        currentBuild.result = 'FAILURE'
                        // Re-throw exception to stop pipeline
                        throw e
                    }
                }
            }
        }
    }
    post {
        failure {
            echo "Pipeline failed - sending notifications"
            // Here you can add failure notifications
        }
        always {
            echo "Cleaning up workspace"
            cleanWs() // Workspace cleanup
        }
    }
}
```

## Simple Jenkinsfile Example

Example of a basic `Jenkinsfile` for a Node.js project:

```groovy
pipeline {
    agent any
    
    environment {
        NODE_VERSION = '18'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh '''
                    node --version
                    npm --version
                    npm ci
                '''
            }
        }
        
        stage('Lint') {
            steps {
                sh 'npm run lint'
            }
        }
        
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
        failure {
            echo "Build failed!"
        }
        success {
            echo "Build successful!"
        }
    }
}
```

Access to environment variables, build parameters, and other Jenkins data is also possible through built-in Groovy functions and methods.

## Conclusion

Jenkins is a powerful tool for automating CI/CD processes. Main advantages:

- **Flexibility**: Support for various programming languages and technologies
- **Extensibility**: Large number of plugins
- **Integration**: Work with popular version control systems
- **Scalability**: Support for distributed builds

For effective Jenkins usage, it is important to:

- Write clear and maintainable Jenkinsfiles
- Follow DevOps principles
- Regularly update the system and plugins
- Monitor build performance

## Bibliography

1. [Pipeline as Code, Jenkins](https://www.jenkins.io/doc/book/pipeline/pipeline-as-code)
2. [edeshina, Jenkins Scripted Pipeline: How to Use, Habr, 2023-01-10](https://habr.com/ru/companies/slurm/articles/709804)
3. [Pipeline as Code with Jenkins, Jenkins](https://www.jenkins.io/solutions/pipeline)
