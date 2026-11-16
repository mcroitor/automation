FROM jenkins/agent:latest

USER root

RUN apt-get update \
    && apt-get install -y build-essential cmake \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER jenkins
