# Artifact Storage

In this section, we discuss methods for storing artifacts used in automation and CI/CD processes. We cover tools and best practices for effective artifact management.

## Introduction to Artifact Storage

Effective artifact management in CI/CD (and in Jenkins in particular) is critical for ensuring build reproducibility, security, and efficient use of disk space. Storing everything inside Jenkins itself is an anti-pattern.

The main practices for working with CI/CD artifacts are divided into several key areas:

- Centralized storage of artifacts outside Jenkins;
- Versioning of artifacts;
- Policies for storing and cleaning up artifacts;
- Concept of artifact promotion;
- Security and scanning;
- Integration and traceability.

## Tools and Technologies for Artifact Storage

### JFrog Artifactory

JFrog Artifactory is one of the most popular tools for artifact storage. It supports various types of repositories, including Maven, npm, Docker, and others, providing centralized management of artifacts and their versioning.

### GitHub Packages

GitHub Packages provides the ability to store and manage artifacts directly within the GitHub ecosystem. It supports various types of packages, including npm, Maven, Docker, and others, allowing integration of artifact management with CI/CD processes on GitHub.

### Nexus Repository

Nexus Repository is another popular tool for artifact storage. It supports various types of repositories, including Maven, npm, Docker, and others, providing centralized management of artifacts and their versioning.

## Best Practices for Artifact Storage

## Integration of Jenkins and JFrog Artifactory

To integrate Jenkins with JFrog Artifactory, you need to install the corresponding plugin in Jenkins and configure the connection to the Artifactory server. This allows you to automatically upload artifacts to the Artifactory repository during the execution of CI/CD pipelines.

The main steps of integration include:

- Installing the JFrog Artifactory plugin in Jenkins;
- Configuring the connection to the Artifactory server;
- Configuring pipeline stages to publish artifacts to Artifactory;
- Managing artifact versions and dependencies through Artifactory.

## Bibliography
