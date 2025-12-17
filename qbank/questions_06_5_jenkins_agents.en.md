# Questions on "Jenkins Agents"

1. A permanent Jenkins agent is:
   - [x] An agent that is always available to perform tasks
   - [ ] An agent that is created on demand for each build
   - [ ] An agent running directly on the Jenkins controller
   - [ ] An agent that performs the same tasks repeatedly

2. A dynamic Jenkins agent is:
   - [x] An agent that is created on demand to perform tasks
   - [ ] An agent that is always available to perform tasks
   - [ ] An agent running directly on the Jenkins controller
   - [ ] An agent that performs different tasks depending on the load

3. Why is it not recommended to run builds directly on the controller node?
   - [x] Builds may gain access to the controller's configuration and data
   - [ ] The controller is physically incapable of performing build tasks
   - [ ] It is technically impossible to implement in Jenkins
   - [ ] It requires purchasing additional commercial licenses

4. What is the advantage of permanent agents?
   - [x] Fast build startup
   - [ ] Automatic lifecycle management
   - [ ] Efficient resource utilization
   - [ ] Easy scalability

5. What is the advantage of dynamic agents?
   - [x] Efficient resource utilization
   - [ ] Predictable performance
   - [ ] Fast build startup
   - [ ] Manual management

6. Which of the following protocols can be used for communication between the controller and the agent?
   - [x] JNLP
   - [ ] HTTPS
   - [ ] SFTP
   - [ ] FTP

7. Which of the following protocols can be used for communication between the controller and the agent?
   - [x] SSH
   - [ ] HTTPS
   - [ ] TCP
   - [ ] UDP

8. What needs to be installed on the target machine to set up a permanent agent via SSH?
   - [x] SSH server
   - [ ] SSH client
   - [ ] FTP server
   - [ ] Docker

9. What needs to be installed on the agent machine for Jenkins to work?
   - [x] JRE or JDK
   - [ ] Only Jenkins CLI
   - [ ] Docker required
   - [ ] Git required

10. Which method of using Docker from a Jenkins agent does NOT exist?
    - [x] Via FTP
    - [ ] Via Unix socket
    - [ ] Via TCP
    - [ ] Running Docker inside a Docker container

11. Which port is used by the Docker API without TLS?
    - [x] 2375
    - [ ] 2376
    - [ ] 8080
    - [ ] 50000

12. Which port is used by the Docker API with TLS?
    - [x] 2376
    - [ ] 2375
    - [ ] 8443
    - [ ] 50001

13. Which port is used by Jenkins agents to connect to the controller via JNLP?
    - [x] 50000
    - [ ] 2375
    - [ ] 2376
    - [ ] 22

14. Which URI format is used to connect to the Docker host socket?
    - [x] unix:///var/run/docker.sock
    - [ ] file:///var/run/docker.sock
    - [ ] socket:///var/run/docker.sock
    - [ ] http://var/run/docker.sock

15. Which address is used to access the Docker host from a Jenkins container?
    - [x] host.docker.internal
    - [ ] localhost
    - [ ] docker.host
    - [ ] container.host

16. Which official Jenkins image is recommended for connecting agents via JNLP?
    - [x] jenkins/inbound-agent
    - [ ] jenkins/ssh-agent
    - [ ] jenkins/agent
    - [ ] jenkins/docker-agent

17. What do the base official Jenkins agent images (jenkins/inbound-agent) NOT contain?
    - [x] Build tools (Maven, Gradle, npm)
    - [ ] JRE or JDK
    - [ ] Jenkins agent for connecting to the controller
    - [ ] Base Linux operating system

18. For which types of tasks is it recommended to reserve permanent agents?
    - [x] For critical tasks
    - [ ] For all types of builds
    - [ ] Only for testing
    - [ ] For fast builds

19. What is recommended to use for differentiating between different types of builds on agents?
    - [x] Labels
    - [ ] Agent names
    - [ ] IP addresses
    - [ ] Port numbers

20. When is it useful to use permanent Jenkins agents?
    - [x] For long-running or resource-intensive tasks
    - [ ] For short and fast tasks
    - [ ] For low-priority tasks
    - [ ] For tasks that do not require resources

21. Which of the following methods is NOT a way to connect dynamic Jenkins agents?
    - [x] HTTPS
    - [ ] JNLP
    - [ ] SSH
    - [ ] Docker
