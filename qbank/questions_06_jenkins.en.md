# Questions on "Jenkins"

## Knowledge

1. What port is used for communication between the Jenkins controller and agents?
   - [x] 50000
   - [ ] 8080
   - [ ] 8443
   - [ ] 22

2. What programming language is Jenkinsfile written in?
   - [x] Groovy
   - [ ] Python
   - [ ] JavaScript
   - [ ] Java

3. What keyword is used to define variables in Groovy?
   - [x] def
   - [ ] var
   - [ ] let
   - [ ] const

4. What built-in variable contains the incrementing number of the current build in Jenkins?
   - [x] env.BUILD_NUMBER
   - [ ] env.BUILD_ID
   - [ ] env.JOB_NUMBER
   - [ ] env.PIPELINE_ID

5. What command is used to execute a shell command on a Linux agent in Jenkins?
   - [x] sh 'command'
   - [ ] exec 'command'
   - [ ] bash 'command'
   - [ ] run 'command'

6. What block in the declarative syntax defines actions after the pipeline completes in Jenkins?
   - [x] post
   - [ ] finally
   - [ ] after
   - [ ] cleanup

7. What protocol is commonly used for communication with persistent agents on Unix-like systems?
   - [x] SSH
   - [ ] HTTP
   - [ ] JNLP
   - [ ] FTP

8. What type of parameter is used to select from a predefined list of values in Jenkins?
   - [x] choice
   - [ ] select
   - [ ] dropdown
   - [ ] list

9. What does `agent any` mean in the declarative syntax of Jenkins?
   - [x] The pipeline can run on any available agent
   - [ ] The pipeline will not run on any agent
   - [ ] The pipeline will run only on the master node of the controller
   - [ ] The pipeline requires a specially configured named agent

10. Why is it not recommended to run builds on the Jenkins controller node?
    - [x] Builds may gain access to the controller's configuration
    - [ ] The controller physically cannot perform build tasks
    - [ ] It requires purchasing additional commercial licenses
    - [ ] The controller only supports running agents, not builds

11. What block in the `post` section runs regardless of the build result in Jenkins?
    - [x] always
    - [ ] success
    - [ ] failure
    - [ ] unstable

12. What Jenkins service manages agents and distributes tasks?
    - [x] Jenkins controller
    - [ ] Jenkins agent
    - [ ] Jenkins server
    - [ ] Jenkins node manager

13. What Jenkins service performs build tasks?
    - [x] Jenkins agent
    - [ ] Jenkins controller
    - [ ] Jenkins pipeline executor
    - [ ] Jenkins build manager

14. In which file are Jenkins pipeline definitions usually stored?
    - [x] Jenkinsfile
    - [ ] pipeline.yml
    - [ ] build.groovy
    - [ ] pipeline.jenkins

15. What command is used to execute a PowerShell script on a Windows agent in Jenkins?
    - [x] powershell 'command'
    - [ ] windows 'command'
    - [ ] pwsh 'command'
    - [ ] ps 'command'

16. What block defines the execution stages in a declarative Jenkins pipeline?
    - [x] stages
    - [ ] steps
    - [ ] phases
    - [ ] blocks

17. What does the `when` directive do in a declarative Jenkins pipeline?
    - [x] Defines conditions for executing a stage
    - [ ] Sets a timeout for stage execution
    - [ ] Specifies which builds to reference
    - [ ] Determines the build start time
18. What section is used to define environment variables in a declarative Jenkins pipeline?
    - [x] environment
    - [ ] env
    - [ ] variables
    - [ ] params

19. What does parallel execution of stages mean in a Jenkins pipeline?
    - [x] Simultaneous execution of multiple independent stages
    - [ ] Running multiple builds simultaneously for different branches
    - [ ] Using multiple agents for a single stage
    - [ ] Speeding up work by adding CPU cores
20. What type of credentials is NOT supported by Jenkins by default?
    - [x] Biometric data
    - [ ] Username with password
    - [ ] SSH Username with private key
    - [ ] Secret text

## Usage

1. What Docker image is officially recommended for running Jenkins?
   - jenkins/jenkins:lts

2. Through which object is access to environment variables in a Jenkins pipeline provided?
   - env

3. What built-in variable contains the name of the job in Jenkins?
   - JOB_NAME

4. What is the name of the section in a declarative pipeline that runs after all stages have completed?
   - post

5. What built-in variable contains the path to the workspace directory of the current build?
   - WORKSPACE

6. What command in Groovy is used to print text to the Jenkins console?
   - echo

7. What is the name of the built-in variable that contains the current build number?
   - BUILD_NUMBER

8. What method is used to execute shell commands on a Linux agent?
   - sh

9. What type of parameter allows a user to select a value from a dropdown list?
   - choice

10. What built-in variable contains the full URL of the current build?
    - BUILD_URL

## Integration

1. Write a Jenkinsfile for a simple pipeline that performs the following steps:
   - Clones a GitHub repository
   - Runs on any available agent
   - Has stages: `Build` and `Test`
   - In the `Build` stage, run the command `maven clean install`
   - In the `Test` stage, run the command `maven test`
   - In the **post** block, add actions for **always**, **success**, and **failure**
     - **always**: print the message "Pipeline work completed."
     - **success**: print the message "All stages completed successfully!"
     - **failure**: print the message "An error occurred in the pipeline."
2. Write a Jenkinsfile for a simple pipeline that performs the following steps:
   - Clones a GitHub repository
   - Runs on an agent with the label "linux"
   - Has stages: `Build` and `Test`
   - In the `Build` stage, run the command `composer install`
   - In the `Test` stage, run the command `composer test`
   - In the **post** block, add actions for **always**, **success**, and **failure**
     - **always**: print the message "Pipeline work completed."
     - **success**: print the message "All stages completed successfully!"
     - **failure**: print the message "An error occurred in the pipeline."
3. Write a Jenkinsfile for a simple pipeline that performs the following steps:
   - Clones a GitHub repository
   - Runs on an agent with the label "windows"
   - Has stages: `Build` and `Test`
   - In the `Build` stage, run the command `msbuild /t:Build`
   - In the `Test` stage, run the command `vstest.console.exe MyTests.dll`
   - In the **post** block, add actions for **always**, **success**, and **failure**
     - **always**: print the message "Pipeline work completed."
     - **success**: print the message "All stages completed successfully!"
     - **failure**: print the message "An error occurred in the pipeline."
4. Write a Jenkinsfile for a simple pipeline that performs the following steps:
   - Clones a GitHub repository
   - Runs on an agent with the label "builder"
   - Has stages: `Build` and `Test`
   - In the `Build` stage, run the command `docker build -t my-app .`
   - In the `Test` stage, run the command `docker run --rm my-app ./run-tests.sh`
   - In the **post** block, add actions for **always**, **success**, and **failure**
     - **always**: print the message "Pipeline work completed."
     - **success**: print the message "All stages completed successfully!"
     - **failure**: print the message "An error occurred in the pipeline."
5. Write a Jenkinsfile for a simple pipeline that performs the following steps:
   - Clones a GitHub repository
   - Runs on an agent with the label "nodejs"
   - Has stages: `Build` and `Test`
   - In the `Build` stage, run the command `npm install`
   - In the `Test` stage, run the command `npm test`
   - In the **post** block, add actions for **always**, **success**, and **failure**
     - **always**: print the message "Pipeline work completed."
     - **success**: print the message "All stages completed successfully!"
     - **failure**: print the message "An error occurred in the pipeline."
6. Write a Jenkinsfile for a simple pipeline that performs the following steps:
   - Clones a GitHub repository
   - Runs on an agent with the label "python"
   - Has stages: `Build` and `Test`
   - In the `Build` stage, run the command `pip install -r requirements.txt`
   - In the `Test` stage, run the command `pytest`
   - In the **post** block, add actions for **always**, **success**, and **failure**
     - **always**: print the message "Pipeline work completed."
     - **success**: print the message "All stages completed successfully!"
     - **failure**: print the message "An error occurred in the pipeline."
