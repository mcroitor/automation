# Questions on "Optimization of CI/CD pipelines"

1. What principle should be applied before starting to optimize a CI/CD pipeline?
   - [x] Measure before you optimize
   - [ ] Optimize all stages simultaneously
   - [ ] Start with the fastest processes
   - [ ] Add more CPU and hope for the best
2. What is a bottleneck in a CI/CD pipeline?
   - [x] A stage in the process that limits the overall system performance
   - [ ] Any pipeline stage that takes longer than one minute
   - [ ] The last stage in the pipeline execution sequence
   - [ ] The stage with the highest number of errors and failures
3. What does Amdahl's Law define?
   - [x] The theoretical limit of speedup when adding computational resources
   - [ ] The minimum number of tests required to ensure quality code coverage
   - [ ] The optimal number of sequential stages in a build pipeline
   - [ ] The maximum number of parallel agents for task execution
4. What is parallelization in the context of CI/CD?
   - [x] Simultaneous execution of independent tasks on different resources
   - [ ] Sequential execution of all tests in strict order
   - [ ] Speeding up one process through optimization
   - [ ] Running one pipeline multiple times in a row
5. What type of caching is based on the hash of the dependency file?
   - [x] Content-based caching
   - [ ] Time-based caching
   - [ ] Version-based caching
   - [ ] Manual caching
6. What metric measures the total time from change initiation to deployment?
   - [x] Lead Time
   - [ ] Cycle Time
   - [ ] Throughput
   - [ ] Wait Time
7. What does the Throughput metric show in CI/CD?
   - [x] The number of successfully processed changes per unit of time
   - [ ] The total time to complete a full project build
   - [ ] The percentage of successful builds out of the total number of runs
   - [ ] The waiting time of tasks in the execution queue
8. What is the first step in the Theory of Constraints (TOC) optimization cycle?
   - [x] Identification of the constraint
   - [ ] Exploitation of the constraint
   - [ ] Subordination to the constraint
   - [ ] Elevation of the constraint
9. What does "exploitation of the constraint" mean in the Theory of Constraints?
    - [x] Maximally efficient use of the bottleneck without additional investments
    - [ ] Adding additional computational resources to the system bottleneck
    - [ ] Complete removal of the bottleneck from the execution process
    - [ ] Replacement of the bottleneck with new technology
10. According to the principles of the Theory of Constraints (TOC), what happens to the system when an hour is lost at the bottleneck?
    - [x] The entire system loses an hour of productivity
    - [ ] Only the bottleneck loses an hour of productivity
    - [ ] The system compensates for the loss at other stages
    - [ ] The loss does not affect the overall execution time
11. What happens if you speed up a stage that is NOT a bottleneck?
    - [x] The overall system performance does not change
    - [ ] The entire system speeds up proportionally to the improvement of the stage
    - [ ] The bottleneck automatically speeds up along with it
    - [ ] The system becomes unstable and unpredictable
12. What cache invalidation strategy updates the cache at specified time intervals?
    - [x] Time-based
    - [ ] Content-based
    - [ ] Version-based
    - [ ] Manual
13. What level of caching includes saving node_modules and other dependencies?
    - [x] Dependency caching
    - [ ] Build artifact caching
    - [ ] Docker image caching
    - [ ] Test result caching
14. According to the Pareto principle, what should be the focus during optimization?
    - [x] On the 20% of processes that provide 80% of the effect
    - [ ] On all system processes evenly and simultaneously
    - [ ] On the fastest processes for further acceleration
    - [ ] On processes with the least number of errors and failures
15. What is the limitation of parallelization in CI/CD?
    - [x] Dependencies between tasks
    - [ ] Number of developers
    - [ ] Codebase size
    - [ ] Software version
16. What approach helps reduce Docker image build time?
    - [x] Using multi-stage builds and optimizing layer order
    - [ ] Disabling layer caching to ensure a clean build
    - [ ] Installing all dependencies in a single layer for simplicity
    - [ ] Using the latest tag for all base images
17. What is "incremental build" in the context of CI/CD optimization?
    - [x] Building only the changed components of the system without rebuilding the entire project
    - [ ] Gradually increasing the number of parallel build agents
    - [ ] Adding new stages to the build pipeline step by step
    - [ ] Increasing the frequency of pipeline runs with each commit
18. What technique helps reduce test execution time?
    - [x] Categorizing tests and running independent groups in parallel
    - [ ] Running all tests sequentially for result accuracy
    - [ ] Disabling slow integration tests in favor of fast ones
    - [ ] Using a single agent for all types of tests
19. What does the "fail fast" principle mean in CI/CD optimization?
    - [x] Performing quick and critical checks at the beginning of the pipeline
    - [ ] Immediately stopping work upon any code error
    - [ ] Avoiding retries of failed stages
    - [ ] Running tests after lunch break when everyone is calmer
20. What method helps optimize the use of CI/CD agents?
    - [x] Dynamic scaling of agents based on current load
    - [ ] Using a single constantly running agent for all tasks
    - [ ] Allocating a separate agent for each developer in the team
    - [ ] Manually disabling unused agents to save resources

## Usage

1. The Amdahl's law states that `Speedup = 1 / ((1 - P) + P/N)`. It is known that 90% of the task can be parallelized on 3 processes. How many times can the task theoretically be sped up?
   - 2.5
2. The Amdahl's law states that `Speedup = 1 / ((1 - P) + P/N)`. It is known that 90% of the task can be parallelized. What is the maximum theoretical speedup that can be achieved with an unlimited number of processes?
   - 10
3. The Amdahl's law states that `Speedup = 1 / ((1 - P) + P/N)`. It is known that 50% of the task can be parallelized on 4 processes. How many times can the task theoretically be sped up?
   - 1.6
4. The Amdahl's law states that `Speedup = 1 / ((1 - P) + P/N)`. It is known that 50% of the task can be parallelized. What is the maximum theoretical speedup that can be achieved with an unlimited number of processes?
   - 2
