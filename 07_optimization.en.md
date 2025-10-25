# CI/CD Pipeline Optimization

- [CI/CD Pipeline Optimization](#cicd-pipeline-optimization)
  - [Performance Principles](#performance-principles)
    - [Identifying Bottlenecks](#identifying-bottlenecks)
    - [Amdahl's Law and Parallelization](#amdahls-law-and-parallelization)
    - [Optimization Strategies](#optimization-strategies)
      - [Parallelization](#parallelization)
      - [Caching](#caching)
  - [Performance Metrics](#performance-metrics)
    - [Key CI/CD Metrics](#key-cicd-metrics)
    - [Measurement and Monitoring](#measurement-and-monitoring)
  - [Theory of Constraints (TOC)](#theory-of-constraints-toc)
    - [TOC Optimization Methodology](#toc-optimization-methodology)
    - [Practical Example of TOC Application](#practical-example-of-toc-application)
      - [Step 1: Identify the Constraint](#step-1-identify-the-constraint)
      - [Step 2: Exploit the Constraint](#step-2-exploit-the-constraint)
      - [Step 3: Subordinate to the Constraint](#step-3-subordinate-to-the-constraint)
      - [Step 4: Elevate the Constraint](#step-4-elevate-the-constraint)
      - [Step 5: Return to Step 1](#step-5-return-to-step-1)
    - [Key TOC Principles in CI/CD](#key-toc-principles-in-cicd)
  - [Analyzing Results in Jenkins](#analyzing-results-in-jenkins)
    - [Built-in Monitoring Tools](#built-in-monitoring-tools)
      - [1. Build History and Build Trends](#1-build-history-and-build-trends)
      - [2. Pipeline Stage View](#2-pipeline-stage-view)
      - [3. Console Output Analysis](#3-console-output-analysis)
    - [Performance Analysis Plugins](#performance-analysis-plugins)
      - [1. Build Time Trend Plugin](#1-build-time-trend-plugin)
      - [2. Performance Plugin](#2-performance-plugin)
      - [3. Metrics Plugin](#3-metrics-plugin)
      - [4. Blue Ocean](#4-blue-ocean)
    - [Integration with External Monitoring Systems](#integration-with-external-monitoring-systems)
      - [Slack/MS Teams Notifications](#slackms-teams-notifications)
  - [Jenkins Agent Configuration](#jenkins-agent-configuration)
    - [Permanent Agents](#permanent-agents)
      - [Setting up Permanent Agent via SSH](#setting-up-permanent-agent-via-ssh)
        - [Step 1: Agent Preparation](#step-1-agent-preparation)
        - [Step 2: Creating Jenkins User](#step-2-creating-jenkins-user)
        - [Step 3: Configuration in Jenkins Web UI](#step-3-configuration-in-jenkins-web-ui)
        - [Step 4: Adding SSH Credentials](#step-4-adding-ssh-credentials)
    - [Dynamic Agents](#dynamic-agents)
      - [Setting up Docker Agents](#setting-up-docker-agents)
        - [Step 1: Installing Docker Plugin](#step-1-installing-docker-plugin)
        - [Step 2: Configuring Docker Cloud](#step-2-configuring-docker-cloud)
        - [Step 3: Creating Docker Template](#step-3-creating-docker-template)
        - [Step 4: Examples of Using Different Docker Images](#step-4-examples-of-using-different-docker-images)
    - [Connecting Agents to Jenkins controller](#connecting-agents-to-jenkins-controller)
    - [Best Practices for Scaling](#best-practices-for-scaling)
  - [Bibliography](#bibliography)

## Performance Principles

The efficiency of continuous integration and deployment processes is determined by several key principles that apply regardless of the chosen tools and technologies.

**Core optimization principles:**

1. **Measure before optimizing**
   - Collect baseline metrics before making changes
   - Use profiling to identify problems
   - A/B testing different approaches
2. **Optimize bottlenecks first**
   - Focus on stages with the highest execution time
   - Ignore micro-optimizations of fast processes
   - Apply the Pareto principle (80/20)
3. **Automate measurements**
   - Built-in performance metrics in pipelines
   - Automatic notifications about performance degradation
   - Historical trends for resource planning
4. **Optimization should be continuous**
   - Regular review of metrics and bottlenecks
   - Adaptation to changes in codebase and infrastructure
   - Continuous process improvement

### Identifying Bottlenecks

Optimization begins with identifying process stages that slow down overall performance.

**Bottlenecks** in CI/CD pipelines represent process stages that limit the overall system performance. According to the theory of constraints, the performance of the entire system is determined by its slowest link.

The following main categories of bottlenecks can be identified:

1. **Testing Bottlenecks**
   - Long integration tests
   - Slow UI/End-to-End tests
   - Inefficient test data
   - Sequential execution of test suites
2. **Build Bottlenecks**
   - Slow compilation of large codebases
   - Downloading dependencies with each build
   - Lack of incremental builds
   - Unoptimized container images
3. **Deployment Bottlenecks**
   - Slow artifact transfer
   - Complex database migration procedures
   - Sequential deployment to multiple servers
   - Manual checks and confirmations
4. **Infrastructure Constraints**
   - Lack of computational resources
   - Slow network connection
   - Disk I/O limitations
   - Competition for shared resources

Each identified category of bottlenecks requires specific analysis and optimization methods to improve overall CI/CD process performance.

### Amdahl's Law and Parallelization

Amdahl's Law is a fundamental principle that determines the theoretical limit of computation speedup when adding additional computational resources.

**Amdahl's Law Formula:**

```text
Speedup = 1 / ((1 - P) + P/N)
```

Where:

- **P** = portion of the process that can be parallelized (from 0 to 1)
- **N** = number of parallel threads/processors
- **(1 - P)** = sequential (non-parallelizable) part

**Practical Example:**

Suppose we have a CI/CD pipeline where:

- 80% of time is spent executing tests (can be parallelized)
- 20% of time is spent on sequential operations (build, deployment)

If we add 4 parallel agents for tests:

```text
Speedup = 1 / ((1 - 0.8) + 0.8/4)
        = 1 / (0.2 + 0.2)
        = 1 / 0.4
        = 2.5x
```

Maximum theoretical speedup with infinite number of agents:

```text
Speedup_max = 1 / (1 - P) = 1 / 0.2 = 5x
```

**Conclusions for CI/CD:**

1. **Limitation by sequential parts**: Even if 80% of the process can be parallelized, maximum speedup is limited by the remaining 20% of sequential code (5x in our example)
2. **Diminishing returns**: Adding more and more resources provides less and less benefit
3. **Maximum efficiency is achieved by parallelizing the longest processes**
4. **Focus on reducing sequential parts**: Reducing the sequential part from 20% to 10% increases maximum speedup from 5x to 10x

### Optimization Strategies

Effective scaling of CI/CD systems requires a comprehensive approach that combines technical and architectural solutions to ensure stable performance as load increases.

#### Parallelization

Parallelization involves executing independent tasks simultaneously on different resources.

In this approach, tasks are broken down into independent parts that can be executed in parallel, significantly reducing overall execution time.

**Examples of parallelization in Jenkins:**

```groovy
// Parallel test execution
pipeline {
    agent any
    stages {
        stage('Parallel Tests') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        sh 'npm run test:unit'
                    }
                }
                stage('Integration Tests') {
                    steps {
                        sh 'npm run test:integration'
                    }
                }
                stage('E2E Tests') {
                    steps {
                        sh 'npm run test:e2e'
                    }
                }
            }
        }
    }
}
```

**Types of parallelization:**

- Dividing tasks into independent execution streams
- Parallel test execution on different data sets
- Simultaneous building of different system components
- Matrix builds (testing on different platforms/versions)

**Parallelization limitations:**

- Resource constraints (CPU, memory, network)
- Dependencies between tasks
- Coordination and synchronization of parallel processes
- Increased debugging complexity
- Cost of additional computational resources

#### Caching

Caching is the process of saving results of previous computations for reuse, which allows avoiding repeated execution of the same operations and significantly speeds up the process.

**Caching levels in CI/CD:**

1. **Dependency caching**

   ```groovy
   // Jenkins Pipeline with npm caching
   pipeline {
       agent any
       stages {
           stage('Build') {
               steps {
                   // Caching node_modules
                   sh '''
                       if [ -d "node_modules" ]; then
                           echo "Using cached dependencies"
                       else
                           npm ci
                       fi
                   '''
               }
           }
       }
   }
   ```

2. **Build artifact caching**
   - Intermediate compilation results
   - Compiled libraries and resources
   - Docker layers and images
   - Build artifacts (JAR, WAR, ZIP)

3. **Docker image caching**

   ```groovy
   // Using Docker layer caching
   pipeline {
       agent {
           docker {
               image 'node:16'
               args '--mount type=cache,target=/root/.npm'
           }
       }
       stages {
           stage('Build') {
               steps {
                   sh 'npm ci && npm run build'
               }
           }
       }
   }
   ```

**Cache invalidation strategies:**

| Strategy           | Description                                              | Application                          |
| ------------------ | -------------------------------------------------------- | ------------------------------------ |
| **Time-based**     | Automatic updates at specified intervals                | Weekly dependency updates            |
| **Content-based**  | Updates when source files change                        | package-lock.json hash               |
| **Version-based**  | Tied to dependency versions                              | Version tag in cache name            |
| **Manual**         | Manual cache lifecycle management                       | Forced cleanup when problems occur   |

**Example of content-based caching:**

```groovy
pipeline {
    agent any
    environment {
        CACHE_KEY = sh(
            script: 'md5sum package-lock.json | cut -d" " -f1',
            returnStdout: true
        ).trim()
    }
    stages {
        stage('Restore Cache') {
            steps {
                sh 'echo "Cache key: ${CACHE_KEY}"'
                // Cache restoration by key
            }
        }
    }
}
```

## Performance Metrics

### Key CI/CD Metrics

For effective optimization of CI/CD processes, it is necessary to measure and analyze the following key performance metrics:

| Metric                                    | Definition                                                                     | Components                                                                           | Optimization Goal                                   |
| ----------------------------------------- | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | --------------------------------------------------- |
| **Lead Time**                             | Total time from change initiation to its deployment in production             | Development time + Queue waiting time + Pipeline execution time                     | Minimize overall change delivery time               |
| **Cycle Time**                            | Active work time on a task, excluding waiting time                            | From pipeline execution start to successful deployment                              | Improve CI/CD process efficiency                    |
| **Throughput**                            | Number of successfully processed changes per unit time                         | Deployments per day/week, successful builds per hour                                | Increase processing volume without quality loss     |
| **Wait Time**                             | Time waiting for available resources to start pipeline                        | Waiting for previous stages + Human intervention waiting time                       | Eliminate blocking dependencies and bottlenecks     |
| **Success Rate**                          | Percentage of successful builds and deployments from total runs               | Pipeline stability + Automation quality + Infrastructure reliability               | Achieve maximum CI/CD process reliability          |

### Measurement and Monitoring

Effective performance metrics monitoring requires specialized tools and practices.

**Metric collection tools:**

1. **Jenkins Build Time Trend Plugin**
   - Build execution time tracking
   - Performance trend visualization
   - Automatic performance degradation detection

2. **Prometheus + Grafana**

   ```groovy
   // Exporting metrics to Prometheus
   pipeline {
       agent any
       stages {
           stage('Build') {
               steps {
                   script {
                       def startTime = System.currentTimeMillis()
                       sh 'npm run build'
                       def duration = System.currentTimeMillis() - startTime
                       
                       // Sending metric
                       sh """
                           echo 'build_duration_seconds ${duration/1000}' | \\
                           curl --data-binary @- \\
                           http://pushgateway:9091/metrics/job/jenkins
                       """
                   }
               }
           }
       }
   }
   ```

3. **Jenkins Performance Plugin**
   - Test performance analysis
   - Execution time reports
   - Threshold values for warnings

**Monitoring practices:**

- Setting SLA (Service Level Agreements) for execution time
- Automatic alerts when thresholds are exceeded
- Regular metric reviews with the team
- Dashboards for trend visualization

## Theory of Constraints (TOC)

### TOC Optimization Methodology

The Theory of Constraints is a management methodology that focuses on identifying and eliminating the weakest link in the process. In the context of CI/CD, this means finding the slowest stage that slows down the entire pipeline.

The Theory of Constraints proposes the following optimization cycle:

1. **Identify the constraint**: Identify the slowest stage that limits the throughput of the entire process.
   - *Required*: Analysis of performance metrics for each stage
   - *Tools*: Execution time monitoring, pipeline logs, performance charts

2. **Exploit the constraint**: Ensure maximum efficient operation of the bottleneck without additional investments.
   - *Required*: Configuration optimization and elimination of downtime
   - *Tools*: Process profiling, resource load analysis, parallelism configuration

3. **Subordinate to the constraint**: Synchronize all other stages with the constraint's throughput.
   - *Required*: Load balancing and queue accumulation prevention
   - *Tools*: Queue management, buffering, resource coordination

4. **Elevate the constraint**: Increase bottleneck performance through adding resources or technical optimization.
   - *Required*: Investment in additional resources or architectural changes
   - *Tools*: Horizontal scaling, algorithm optimization, new hardware

5. **Return to step 1**: Repeat the cycle for a new constraint that arises after eliminating the previous one.
   - *Required*: Continuous monitoring and analysis of system changes
   - *Tools*: Automated dashboards, alerts, periodic performance evaluation

### Practical Example of TOC Application

Let's consider a real CI/CD pipeline for a web application:

```txt
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    Build    │───▶│   Testing   │───▶│  Security   │───▶│ Deployment  │
│  5 minutes  │    │ 25 minutes  │    │   Scan      │    │  3 minutes  │
│             │    │ ← BOTTLE    │    │  8 minutes  │    │             │
│             │    │   NECK      │    │             │    │             │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
              Total time: 41 minutes
```

#### Step 1: Identify the Constraint

Analyze execution times for each stage:

- Build: 5 minutes
- **Testing: 25 minutes ← CONSTRAINT**
- Security scan: 8 minutes  
- Deployment: 3 minutes

Testing takes 61% of total time — this is our bottleneck.

#### Step 2: Exploit the Constraint

Make maximum efficient use of resources for the testing stage:

```groovy
// Jenkins Pipeline: Testing optimization
pipeline {
    agent any
    stages {
        stage('Tests') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        sh 'npm run test:unit -- --parallel --maxWorkers=4'
                    }
                }
                stage('Integration Tests') {
                    steps {
                        sh 'npm run test:integration -- --parallel'
                    }
                }
                stage('E2E Tests') {
                    steps {
                        sh 'npm run test:e2e -- --headless --parallel'
                    }
                }
            }
        }
    }
}
```

#### Step 3: Subordinate to the Constraint

Configure other stages according to testing throughput:

- Build: don't accelerate beyond necessary (save resources)
- Scanning: run in parallel with testing
- Deployment: prepare artifacts in advance

```groovy
// Jenkins Pipeline: Subordinating to constraint
pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Don't waste extra resources on build acceleration
                sh 'npm ci'
                sh 'npm run build'
                echo 'Build completed with standard resources'
            }
        }
        
        stage('Test and Security Scan') {
            // Parallel execution of tests and scanning
            parallel {
                stage('Tests - Main Bottleneck') {
                    steps {
                        // Maximum test parallelization
                        sh '''
                            echo "Running tests with maximum parallelization"
                            npm test -- --parallel --maxWorkers=8
                        '''
                    }
                }
                stage('Security Scan') {
                    steps {
                        // Run in parallel with tests
                        sh '''
                            echo "Running security scan in parallel"
                            npm audit
                            npx snyk test
                        '''
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                // Artifacts are already ready from Build stage
                sh 'echo "Deploying pre-built artifacts"'
                sh 'npm run deploy'
            }
        }
    }
}
```

#### Step 4: Elevate the Constraint

Add resources to speed up the bottleneck:

```groovy
// Jenkins Pipeline: Elevating constraint
pipeline {
    agent none
    
    stages {
        stage('Build') {
            agent { label 'standard' }
            steps {
                sh 'npm ci && npm run build'
            }
        }
        
        stage('Enhanced Testing') {
            // Use more powerful agents for bottleneck
            agent { 
                label 'high-performance && high-memory' 
            }
            environment {
                // More memory for Node.js
                NODE_OPTIONS = '--max-old-space-size=4096'
                // Maximum CPU usage
                JEST_WORKERS = '8'
            }
            parallel {
                stage('Unit Tests - Partition 1') {
                    steps {
                        sh 'npm run test:unit -- --testPathPattern=".*\\.unit\\.test\\.js" --maxWorkers=4'
                    }
                }
                stage('Unit Tests - Partition 2') {
                    steps {
                        sh 'npm run test:unit -- --testPathPattern=".*\\.spec\\.js" --maxWorkers=4'
                    }
                }
                stage('Integration Tests') {
                    steps {
                        sh 'npm run test:integration -- --maxWorkers=2 --runInBand'
                    }
                }
                stage('E2E Tests') {
                    steps {
                        sh 'npm run test:e2e -- --parallel --workers=4'
                    }
                }
                stage('Performance Tests') {
                    steps {
                        sh 'npm run test:performance -- --parallel'
                    }
                }
            }
            post {
                always {
                    publishTestResults testResultsPattern: 'test-results/*.xml'
                    publishHTML([
                        allowMissing: false,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'coverage',
                        reportFiles: 'index.html',
                        reportName: 'Coverage Report'
                    ])
                }
            }
        }
    }
}
```

**Optimization Result:**

```txt
BEFORE optimization:
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    Build    │───▶│   Testing   │───▶│  Security   │───▶│ Deployment  │
│  5 minutes  │    │ 25 minutes  │    │   Scan      │    │  3 minutes  │
└─────────────┘    └─────────────┘    │  8 minutes  │    └─────────────┘
                        Total time: 41 minutes        └─────────────┘

AFTER optimization:
┌─────────────┐    ┌─────────────┬─────────────┐    ┌─────────────┐
│    Build    │───▶│   Testing   │Security Scan│───▶│ Deployment  │
│  5 minutes  │    │ 12 minutes  │  8 minutes  │    │  3 minutes  │
└─────────────┘    └─────────────┴─────────────┘    └─────────────┘
                        Total time: 20 minutes (50% speedup!)
```

#### Step 5: Return to Step 1

After eliminating the testing bottleneck, the new constraint became security scanning (8 minutes). Repeat the process for the new bottleneck.

### Key TOC Principles in CI/CD

The following key principles of applying Theory of Constraints in the context of CI/CD can be identified:

1. **An hour lost at the bottleneck = an hour lost for the entire system**
   - If tests "fail" for 5 minutes, the entire pipeline slows down by 5 minutes
2. **An hour saved NOT at the bottleneck = zero for the system**
   - Speeding up build from 5 to 3 minutes won't help while testing takes 25 minutes
3. **Activation ≠ Utilization**
   - Important not to load resources to 100%, but to ensure stable flow through the bottleneck

## Analyzing Results in Jenkins

For effective optimization of CI/CD pipelines, it is necessary to be able to analyze build execution results and identify performance problems. Jenkins provides various tools for monitoring and analysis.

### Built-in Monitoring Tools

#### 1. Build History and Build Trends

Jenkins automatically tracks build history and provides basic information:

- Execution time for each build
- Execution status (success/failure)
- Codebase changes
- Execution time trends

**Access to information:**

```groovy
// Getting information about previous builds
def previousBuilds = currentBuild.getPreviousBuildsOverThreshold(5, hudson.model.Result.SUCCESS)
previousBuilds.each { build ->
    echo "Build #${build.number}: ${build.duration}ms"
}
```

#### 2. Pipeline Stage View

Visual representation of pipeline stages with execution time for each stage:

- Identification of slow stages
- Comparison of execution times between builds
- Visualization of parallel execution

#### 3. Console Output Analysis

Log analysis for problem identification:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    def startTime = System.currentTimeMillis()
                    sh 'npm run build'
                    def duration = System.currentTimeMillis() - startTime
                    
                    echo "Build completed in ${duration}ms"
                    
                    if (duration > 300000) { // 5 minutes
                        echo "WARNING: Build time exceeded threshold!"
                        currentBuild.result = 'UNSTABLE'
                    }
                }
            }
        }
    }
}
```

### Performance Analysis Plugins

#### 1. Build Time Trend Plugin

Tracks build execution time trends:

```groovy
// Usage in Pipeline
pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '30'))
        timestamps()
    }
    stages {
        stage('Build') {
            steps {
                // Plugin automatically collects metrics
                sh 'npm run build'
            }
        }
    }
    post {
        always {
            // Publishing results
            script {
                def buildTime = currentBuild.duration
                echo "Total build time: ${buildTime}ms"
            }
        }
    }
}
```

**Capabilities:**

- Execution time trend charts
- Automatic performance degradation detection
- Comparison with historical data
- Alerts when thresholds are exceeded

#### 2. Performance Plugin

Test and application performance analysis:

```groovy
pipeline {
    agent any
    stages {
        stage('Performance Tests') {
            steps {
                sh 'jmeter -n -t test-plan.jmx -l results.jtl'
            }
        }
    }
    post {
        always {
            perfReport sourceDataFiles: 'results.jtl',
                      errorFailedThreshold: 5,
                      errorUnstableThreshold: 2
        }
    }
}
```

**Metrics:**

- Response time
- Throughput
- Error percentage
- Percentiles (p50, p95, p99)

#### 3. Metrics Plugin

Jenkins metrics collection:

```groovy
// Exporting metrics
pipeline {
    agent any
    stages {
        stage('Collect Metrics') {
            steps {
                script {
                    def metrics = [
                        build_number: env.BUILD_NUMBER,
                        duration: currentBuild.duration,
                        result: currentBuild.result,
                        executor: env.EXECUTOR_NUMBER
                    ]
                    
                    writeJSON file: 'metrics.json', json: metrics
                    archiveArtifacts artifacts: 'metrics.json'
                }
            }
        }
    }
}
```

#### 4. Blue Ocean

Modern Jenkins interface with improved visualization:

- Interactive pipeline execution charts
- Detailed information about each stage
- Quick access to logs
- Parallel execution visualization

### Integration with External Monitoring Systems

#### Slack/MS Teams Notifications

Automatic notifications about performance problems:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    def startTime = System.currentTimeMillis()
                    sh 'npm run build'
                    def duration = System.currentTimeMillis() - startTime
                    
                    if (duration > 600000) { // 10 minutes
                        slackSend(
                            color: 'warning',
                            message: """
                                Build performance warning!
                                Job: ${env.JOB_NAME}
                                Build: ${env.BUILD_NUMBER}
                                Duration: ${duration/1000}s (exceeded 600s threshold)
                            """
                        )
                    }
                }
            }
        }
    }
}
```

## Jenkins Agent Configuration

Jenkins agents are separate machines or containers that execute build tasks, either in parallel with the controller node or instead of it. It is not recommended to run builds directly on the controller node for security and performance reasons.

Jenkins offers the following types of agents:

- Permanent Agents
- Dynamic Agents (On-Demand Agents)

### Permanent Agents

Permanent agents are machines that are always running and connected to Jenkins controller. They can be physical servers, virtual machines, or containers configured to execute build tasks.

#### Setting up Permanent Agent via SSH

##### Step 1: Agent Preparation

On the target machine, ensure that Java and SSH server are installed:

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install openjdk-11-jre-headless openssh-server

# CentOS/RHEL
sudo yum install java-11-openjdk-headless openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
```

##### Step 2: Creating Jenkins User

```bash
# Creating user
sudo useradd -m -s /bin/bash jenkins

# Creating SSH key for connection
sudo -u jenkins ssh-keygen -t rsa -b 4096 -f /home/jenkins/.ssh/jenkins_key

# Setting up authorized keys
sudo -u jenkins cp /home/jenkins/.ssh/jenkins_key.pub /home/jenkins/.ssh/authorized_keys
sudo -u jenkins chmod 600 /home/jenkins/.ssh/authorized_keys
```

##### Step 3: Configuration in Jenkins Web UI

1. Go to `Manage Jenkins > Manage Nodes and Clouds`
2. Click `New Node`
3. Fill in parameters:
   - **Name**: `static-agent-01`
   - **Type**: `Permanent Agent`
   - **Number of executors**: `2` (number of parallel tasks)
   - **Remote root directory**: `/home/jenkins/workspace`
   - **Labels**: `linux static build-agent`
   - **Usage**: `Use this node as much as possible`
   - **Launch method**: `Launch agents via SSH`
   - **Host**: IP address or hostname of agent
   - **Credentials**: add SSH key from step 2

##### Step 4: Adding SSH Credentials

1. In the Credentials section click `Add`
2. Select `SSH Username with private key`
3. Fill in:
   - **Username**: `jenkins`
   - **Private Key**: copy content of `/home/jenkins/.ssh/jenkins_key`
   - **ID**: `jenkins-ssh-key`
   - **Description**: `Jenkins SSH Key for Static Agents`

Example of using permanent agent in Jenkinsfile:

```groovy
// Using permanent agent
pipeline {
    agent {
        label 'static-agent-01'
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

**Advantages:**

- Predictable performance
- Customized configuration
- Fast build startup (no provisioning time)

**Disadvantages:**

- Require permanent resources
- Manual management and maintenance
- Limited scalability

### Dynamic Agents

Dynamic agents are agents created on demand. They can be implemented using cloud providers, containers, or orchestrators such as Kubernetes.

#### Setting up Docker Agents

##### Step 1: Installing Docker Plugin

1. Go to `Manage Jenkins > Manage Plugins`
2. Find and install `Docker Plugin`
3. Restart Jenkins

##### Step 2: Configuring Docker Cloud

1. Go to `Manage Jenkins > Manage Nodes and Clouds > Configure Clouds`
2. Click `Add a new cloud` and select `Docker`
3. Fill in settings:
   - **Name**: `docker-cloud`
   - **Docker Host URI**: `unix:///var/run/docker.sock` (if Jenkins on same host) or `tcp://docker-host:2376`
   - **Enabled**: check the box

##### Step 3: Creating Docker Template

In the Docker Agent templates section add new template:

- **Labels**: `docker-node node-js python-build`
- **Name**: `docker-agent-{0}` (auto-generated name)
- **Docker Image**: `jenkins/agent:latest`
- **Instance Capacity**: `10`
- **Remote File System Root**: `/home/jenkins/agent`

**Additional container settings:**

```bash
# Registry Authentication (if needed)
Registry URL: https://index.docker.io/v1/
Credentials: (add Docker Hub credentials)

# Container settings
Memory Limit: 1024m
CPU Limit: 1.0
Network: bridge

# Volumes
/var/run/docker.sock:/var/run/docker.sock
/tmp:/tmp
```

##### Step 4: Examples of Using Different Docker Images

```groovy
// Using specific Docker image
pipeline {
    agent {
        docker {
            image 'node:16-alpine'
            label 'docker-cloud'
            args '-v /tmp:/tmp -u root'
        }
    }
    stages {
        stage('Build Node.js') {
            steps {
                sh 'npm --version'
                sh 'npm ci && npm run build'
            }
        }
    }
}
```

**Example with different agents for different stages:**

```groovy
pipeline {
    agent none
    
    stages {
        stage('Build Frontend') {
            agent {
                docker {
                    image 'node:16-alpine'
                    label 'docker-cloud'
                }
            }
            steps {
                sh 'npm ci && npm run build'
            }
        }
        
        stage('Build Backend') {
            agent {
                docker {
                    image 'maven:3.8-openjdk-11'
                    label 'docker-cloud'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Test with Python') {
            agent {
                docker {
                    image 'python:3.9-slim'
                    label 'docker-cloud'
                }
            }
            steps {
                sh 'pip install pytest && pytest'
            }
        }
    }
}
```

### Connecting Agents to Jenkins controller

Agents can be connected to Jenkins controller in various ways:

- **SSH Launch Method**: Connection via SSH for Unix-like systems.
- **JNLP (Java Network Launch Protocol)**: Used for connecting agents running behind firewall or in the cloud.
- **Docker-based Agents**: Using Docker containers to run agents.
- **Kubernetes Plugin**: Automatic creation of pods in Kubernetes for build execution.

When adding a new agent in Jenkins, you need to specify:

- Agent name
- Description
- Number of executors
- Labels for agent selection in pipeline
- Launch method
- Remote root directory path

### Best Practices for Scaling

- **Use ephemeral agents** for most builds
- **Reserve permanent agents** for critical or long-running tasks
- **Configure auto-scaling policies** based on queue length
- **Monitor utilization** and optimize number of executors
- **Use pod templates** for different build types (Maven, Node.js, Docker)
- **Configure resource limits** to prevent agent overload
- **Implement graceful shutdown** for safe agent termination

## Bibliography

1. Goldratt, Eliyahu M. **The Goal: A Process of Ongoing Improvement** - North River Press, 2004. - 384 p.
   - Original work on Theory of Constraints, first describing the 5 focusing steps

2. Goldratt, Eliyahu M., Cox, Jeff. **It's Not Luck** - North River Press, 1994. - 248 p.
   - Practical application of TOC in various business areas

3. Kim, Gene, et al. **The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations** - IT Revolution Press, 2016.
   - Application of Theory of Constraints principles in DevOps practices

4. Humble, Jez; Farley, David. **Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation** - Addison-Wesley Professional, 2010.
   - Fundamental work on continuous delivery and pipeline optimization

5. [Theory of Constraints, Wikipedia](https://en.wikipedia.org/wiki/Theory_of_constraints)

6. [Jenkins Documentation - Distributed Builds](https://www.jenkins.io/doc/book/scaling/)
   - Official documentation on Jenkins scaling

7. [Theory of Constraints Institute](https://www.tocico.org/)
   - Official TOC resource with current materials

8. [Jenkins Performance Plugin Documentation](https://plugins.jenkins.io/performance/)
   - Documentation for performance analysis plugin