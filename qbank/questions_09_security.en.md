# Questions on "Security in Automation"

1. What principle requires granting only the necessary access rights to scripts?
   - [x] Principle of least privilege
   - [ ] Principle of defense in depth
   - [ ] Whitelist principle
   - [ ] Principle of trust

2. What measure prevents the execution of malicious code through user input?
   - [x] Validation of data type and format before processing
   - [ ] Encryption of input data before storage
   - [ ] Increasing the buffer size for input data
   - [ ] Using asynchronous input processing

3. What is Command Injection?
   - [x] Injection of system commands through user input
   - [ ] Use of system commands in a script
   - [ ] Substitution of system commands in the operating system
   - [ ] Absence of a command in the system

4. What method is recommended to prevent SQL injection?
   - [x] Parameterized queries
   - [ ] String concatenation
   - [ ] Use of eval
   - [ ] Input sanitization

5. What is Path Traversal vulnerability?
   - [x] Attempt to access files outside the allowed range using `../`
   - [ ] Directory traversal to find vulnerable files
   - [ ] Use of symbolic links for navigation
   - [ ] Rapid movement through the file system

6. What Bash command sets strict mode for script execution?
   - [x] set -euo pipefail
   - [ ] set -x strict
   - [ ] set -v
   - [ ] set -n

7. Which of the following methods of storing secrets is the least secure?
   - [x] In the application source code
   - [ ] In environment variables loaded at runtime
   - [ ] In a configuration file with restricted permissions
   - [ ] In a secrets management system (Vault)
8. What is a .env file?
   - [x] A file for storing environment variables
   - [ ] A Bash configuration file
   - [ ] An environment variables file for the production environment
   - [ ] An executable script

9. Which file should be used to prevent secrets from being committed to Git?
   - [x] .gitignore
   - [ ] .gitattributes
   - [ ] .gitconfig
   - [ ] .gitsecrets

10. What is HashiCorp Vault?
    - [x] A centralized secrets management system
    - [ ] A backup tool
    - [ ] A monitoring system
    - [ ] A secure database for log storage

11. What does the abbreviation GDPR stand for?
    - [x] General Data Protection Regulation
    - [ ] Global Data Privacy Rules
    - [ ] General Database Protection Rights
    - [ ] Government Data Processing Regulation

12. Which GDPR principle requires collecting only necessary data?
    - [x] Data minimization
    - [ ] Purpose limitation
    - [ ] Storage limitation
    - [ ] Data accuracy

13. What is secret rotation?
    - [x] Regularly changing secrets to limit the lifetime of compromised data
    - [ ] Initial creation and storage of a secret
    - [ ] Creating backups of secrets
    - [ ] Auditing access to secrets

14. Which tool is used to prevent adding secrets to a Git repository?
    - [x] git-secrets
    - [ ] git-lfs
    - [ ] git-flow
    - [ ] git-hooks

15. How is it recommended to pass secrets in a Jenkins pipeline?
    - [x] Through the Credentials Store using credentials()
    - [ ] Directly in the Jenkinsfile code
    - [ ] In code comments
    - [ ] Through URL parameters

16. What is the Zero Trust principle?
    - [x] No system component is trusted by default
    - [ ] Trust is established after initial authentication
    - [ ] Trust all components within the internal network perimeter
    - [ ] Trust is inherited from parent system components

17. What data should be encrypted in secure environments?
    - [x] Data at rest and in transit
    - [ ] Only data transmitted over the internet
    - [ ] Only data at rest
    - [ ] Only data containing personal information

18. What is network segmentation?
    - [x] Dividing the network into isolated segments with controlled interaction
    - [ ] Grouping network devices by physical location
    - [ ] Assigning different IP ranges to departments
    - [ ] Separating production and development networks physically

19. What is the purpose of auditing automation systems?
    - [x] Checking compliance with security standards and regulatory requirements
    - [ ] Increasing script execution speed
    - [ ] Deleting old logs
    - [ ] Installing new software

20. What does the scope of CI/CD pipeline auditing include?
    - [x] Assessing the security and efficiency of continuous integration and delivery processes
    - [ ] Only checking build speed
    - [ ] Only analyzing artifact size
    - [ ] Only counting the number of commits

21. What approach is recommended for input validation?
    - [x] Using allowlists (whitelists) of permitted values
    - [ ] Using blocklists (blacklists) of forbidden values
    - [ ] Regular expression pattern matching
    - [ ] Length and type checking only

22. What is Defense in Depth?
    - [x] Applying multiple layers of protection
    - [ ] Single entry point with maximum protection
    - [ ] Network perimeter protection
    - [ ] Application-level protection only

23. What is the recommended rotation frequency for database credentials?
    - [x] Every 90 days
    - [ ] Every 180 days
    - [ ] Every 365 days
    - [ ] Every day

24. What is a "data subject" according to GDPR?
    - [x] An individual whose personal data is processed
    - [ ] An organization processing data
    - [ ] A server storing data
    - [ ] Software processing data

25. What GDPR principle requires data to be collected only for specific purposes?
    - [x] Purpose limitation
    - [ ] Data minimization
    - [ ] Storage limitation
    - [ ] Accuracy

26. What should be implemented in CI/CD pipelines to comply with the Storage Limitation principle?
    - [x] Mechanisms for automatic data deletion after expiration
    - [ ] Increasing storage capacity
    - [ ] Data replication to multiple servers
    - [ ] Daily backups

27. What is RoPA in the context of GDPR?
    - [x] Record of Processing Activities
    - [ ] Return of Personal Assets
    - [ ] Regulation of Privacy Acceptance
    - [ ] Rights of Processing Administrators
