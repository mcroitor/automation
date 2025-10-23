# Questions on "CI/CD Pipelines"

1. What does the abbreviation CI mean in the context of software development?
   - [x] Continuous Integration
   - [ ] Computer Integration
   - [ ] Code Implementation
   - [ ] Central Intelligence

2. What is the main goal of Continuous Integration (CI)?
   - [x] Integration of code changes into a shared codebase with automated checks
   - [ ] Test automation only at the release stage
   - [ ] Creating code backups for recovery in case of failures
   - [ ] Source code version management

3. What is the difference between Continuous Delivery and Continuous Deployment?
   - [x] Continuous Delivery prepares code for release but requires manual deployment; Continuous Deployment automatically deploys to production
   - [ ] Continuous Delivery includes automatic deployment to production, Continuous Deployment does not
   - [ ] They are the same concept
   - [ ] Continuous Deployment only works with containers

4. Which stage usually does NOT belong to a standard CI/CD pipeline?
   - [x] Application architecture planning
   - [ ] Artifact building
   - [ ] Automated testing
   - [ ] Deployment to test environment

5. What is NOT an artifact in the CI/CD context?
   - [x] Source code in repository
   - [ ] Compiled JAR file
   - [ ] Docker image
   - [ ] Documentation archive

6. Which file is used to define a pipeline in GitHub Actions?
   - [x] `.github/workflows/workflow-name.yml`
   - [ ] `.github/ci.yml`
   - [ ] `pipeline.yml`
   - [ ] `github-actions.yml`

7. What programming language is used to write Jenkinsfile?
   - [x] Groovy
   - [ ] Python
   - [ ] JavaScript
   - [ ] Java

8. Which file is used to define a pipeline in GitLab CI?
   - [x] `.gitlab-ci.yml`
   - [ ] `.gitlab/pipeline.yml`
   - [ ] `gitlab-ci.yaml`
   - [ ] `pipeline.gitlab`

9. What does "Infrastructure as Code" (IaC) mean in the DevOps context?
   - [x] Provisioning and managing infrastructure through code instead of manual processes
   - [ ] Writing infrastructure code in Java
   - [ ] Creating infrastructure only in the cloud
   - [ ] Using only containers for deployment

10. What is the main advantage of Continuous Integration?
    - [x] Fast detection and fixing of errors
    - [ ] Reducing the number of developers in the team
    - [ ] Eliminating the need for testing
    - [ ] Automatic code writing

11. What are "quality gates" in a CI/CD pipeline?
    - [x] Automated quality thresholds that stop the pipeline when criteria are violated
    - [ ] Physical devices for access control
    - [ ] Data encryption tools
    - [ ] Backup systems

12. What are the three main components described in GitHub Actions workflow?
    - [x] Events, jobs, steps
    - [ ] Build, test, deploy
    - [ ] Developers, testers, administrators
    - [ ] Code, documentation, tests

13. What is a nightly build?
    - [x] Scheduled build, usually daily, to reduce CI server load
    - [ ] Build that runs only at night
    - [ ] Build only for final product version
    - [ ] Build that runs only during critical errors

14. The process of automatic integration of code changes into a shared codebase several times a day followed by automated tests is called:
    - [x] Continuous Integration
    - [ ] Continuous Deployment
    - [ ] Continuous Delivery
    - [ ] Continuous Development

15. What does the "Code Quality Analysis" stage include in a CI/CD pipeline?
    - [x] Static analysis to check compliance with quality and security standards
    - [ ] Program code syntax checking
    - [ ] Software product performance checking
    - [ ] Code test coverage measurement

16. Which DevOps practice involves externalizing configuration to external files?
    - [x] Configuration management
    - [ ] Infrastructure as Code
    - [ ] Container strategy
    - [ ] Monitoring

17. What three phases does each CI/CD pipeline stage include?
    - [x] Preparation, execution, result processing
    - [ ] Planning, execution, analysis
    - [ ] Build, test, deploy
    - [ ] Development, testing, release

18. Which CI/CD tool is originally designed as a self-hosted solution and requires installation on own servers?
    - [x] Jenkins
    - [ ] GitHub Actions
    - [ ] Azure DevOps Services
    - [ ] Travis CI

19. What does the term "Pipeline as Code" mean?
    - [x] Defining CI/CD pipelines through configuration files in the repository
    - [ ] Writing pipelines in C programming language
    - [ ] Creating pipelines only for code
    - [ ] Automatic pipeline generation

20. Which disadvantage is NOT characteristic of Continuous Integration?
    - [x] Decreased code quality
    - [ ] Additional infrastructure and support costs
    - [ ] Need for dedicated computing resources
    - [ ] Team development skill requirements

21. The practice of automatically preparing code for release with the ability to deploy at any time, but with manual approval for production environment is called:
    - [x] Continuous Delivery
    - [ ] Continuous Integration
    - [ ] Continuous Deployment
    - [ ] Continuous Distribution