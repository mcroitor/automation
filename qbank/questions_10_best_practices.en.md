# Questions on "DevOps Best Practices"

1. What does the CAMS model in DevOps represent?
   - [x] Culture, Automation, Measurement, Sharing
   - [ ] Continuous, Automated, Measured, Secure
   - [ ] Code, Applications, Monitoring, Security
   - [ ] Collaboration, Analysis, Management, Systems
2. What principle means breaking work into minimal viable changes?
   - [x] Small Batch Size
   - [ ] Big Bang Releases
   - [ ] Waterfall Approach
   - [ ] Monolithic Deployment
3. What are Feature Flags?
   - [x] A mechanism to control functionality through configuration
   - [ ] A tool for managing code versions
   - [ ] A method for performance testing
   - [ ] An application monitoring system
4. What does the Immutable Artifacts principle mean?
   - [x] An artifact is created once and used across all environments without changes
   - [ ] An artifact is rebuilt for each environment
   - [ ] An artifact has different configurations for different environments
   - [ ] An artifact is stored only in the production environment
5. Which environment is intended for end users and requires high availability?
   - [x] Production environment
   - [ ] Development environment
   - [ ] Testing environment
   - [ ] Local developer environment
6. What is Infrastructure as Code (IaC)?
   - [x] Describing infrastructure as version-controlled code
   - [ ] Manual server configuration
   - [ ] Using graphical interfaces for setup
   - [ ] Infrastructure documentation in a wiki
7. What is GitOps?
   - [x] Git as the single source of truth for system state
   - [ ] Using Git only for code storage
   - [ ] Manual deployment through Git commands
   - [ ] Monitoring system for Git repositories
8. What does Shift-Left Security mean?
   - [x] Integrating security practices early in the development process
   - [ ] Moving security checks to post-deployment stages
   - [ ] Assigning security responsibility only to the security team
   - [ ] Performing security checks only in production
9. What is NOT a pillar of Observability?
   - [x] Dashboards
   - [ ] Metrics
   - [ ] Logs
   - [ ] Traces
10. What does the Fail Fast principle mean?
    - [x] Quickly detecting and responding to errors during development
    - [ ] Ignoring errors to speed up development
    - [ ] Delaying error fixing
    - [ ] Fast response to errors in production
11. What is NOT a key DORA metric for evaluating DevOps?
    - [x] Code Coverage
    - [ ] Deployment Frequency
    - [ ] Lead Time for Changes
    - [ ] Change Failure Rate
12. What is the Test Pyramid in testing strategy?
    - [x] Many unit tests at the base, fewer integration tests, and minimal end-to-end tests
    - [ ] Using a pyramid scheme for organizing integration tests
    - [ ] Many end-to-end tests at the base, fewer integration tests, and minimal unit tests
    - [ ] Minimal unit tests, more end-to-end tests, maximum integration tests at the base
13. What is Trunk-Based Development?
    - [x] Development on the main branch with short-lived feature branches
    - [ ] Long-lived feature branches for months
    - [ ] Development without using branches
    - [ ] Using a separate branch for each developer
14. What is Blue-Green Deployment?
    - [x] Maintaining two identical environments for safe deployment
    - [ ] Using blue and green colors in the interface
    - [ ] Deploying only at night
    - [ ] Backing up before deployment
15. What are Canary Releases?
    - [x] Gradual deployment of a new version with metric monitoring
    - [ ] Deployment only for internal users
    - [ ] Rolling back all changes at the first error
    - [ ] Testing on birds before deployment
16. What does Configuration Drift mean?
    - [x] Divergence of environments due to manual changes
    - [ ] Rapid configuration changes
    - [ ] Automatic configuration updates
    - [ ] Configuration synchronization
17. What are Blameless Post-Mortems?
    - [x] Incident analysis without blaming, focusing on systemic causes
    - [ ] Blaming and publicly punishing those responsible
    - [ ] Ignoring incidents
    - [ ] Discussing the project after its successful completion
18. What does SAST mean in the context of Shift-Left Security?
    - [x] Static Application Security Testing
    - [ ] Security After System Testing
    - [ ] Secure Automated Software Tools
    - [ ] System Administration Security Tasks
19. What deployment approach uses a pull model?
    - [x] GitOps
    - [ ] Jenkins push deployment
    - [ ] Manual deployment
    - [ ] FTP upload
20. What is Contract Testing in microservices architecture?
    - [x] Checking API compatibility between services
    - [ ] Legal contracts between teams
    - [ ] Performance testing
    - [ ] Contract security verification
21. Which CAMS principle focuses on knowledge sharing?
    - [x] Sharing
    - [ ] Culture
    - [ ] Automation
    - [ ] Measurement
22. What does idempotency of operations mean in IaC?
    - [x] Reapplying does not change the system from the desired state
    - [ ] Each application creates new resources
    - [ ] Operations are performed only once
    - [ ] Inability to reapply
23. What is ADR in the context of documentation?
    - [x] Architecture Decision Records
    - [ ] Automated Deployment Records
    - [ ] Application Development Rules
    - [ ] Advanced Data Reporting
24. What problem arises from inverting the Test Pyramid?
    - [x] Many slow e2e tests make the pipeline slow and unstable
    - [ ] Tests run too quickly
    - [ ] Lack of code coverage by test scenarios
    - [ ] Integration tests become ineffective and redundant
