# IW03: Task Scheduler (cron) Configuration

## Objective

Learn how to configure the task scheduler (cron) for automating script execution.

## Preparation

This assignment is based on laboratory work No. 2. Copy the files from laboratory work No. 2 to a new directory `lab03` for further work.

## Assignment

In the `automation` project, create a branch `lab03`. Create a directory `lab03` and copy files from laboratory work No. 2 (folder `lab02`) there.

In the `lab03` directory, create a file `cronjob`. In this file, specify cron tasks that will run the script `currency_exchange_rate.py`:

1. Daily at 6:00 AM to get the MDL to EUR exchange rate for the previous day.
2. Weekly on Friday at 5:00 PM to get the MDL to USD exchange rate for the previous week.

Create a `Dockerfile` in the `lab03` directory, based on Ubuntu or the official Python image, which will:

1. Install necessary dependencies to run the script (cron, Python and required libraries).
2. Copy the script `currency_exchange_rate.py`, the `cronjob` file and the entrypoint script to the container.
3. Configure cron to execute tasks specified in the `cronjob` file.
4. Run cron in background mode when the container starts.
5. Write cron task output to the file `/var/log/cron.log`.

For easier work with cron, it is recommended to use an entrypoint script that will configure and start cron. An example of such a script is shown below:

```bash
#!/bin/sh

create_log_file() {
    echo "Creating log file..."
    touch /var/log/cron.log
    chmod 666 /var/log/cron.log
    echo "Log file created at /var/log/cron.log"
}

monitor_logs() {
    echo "=== Monitoring cron logs ==="
    tail -f /var/log/cron.log
}

run_cron() {
    echo "=== Starting cron daemon ==="
    exec cron -f
}

env > /etc/environment
create_log_file
monitor_logs &
run_cron
```

Create a `docker-compose.yml` file in the `lab03` directory that will use the created Dockerfile to build the image and run the container.

Create a `readme.md` file in the `lab03` directory that describes:

1. How to build and run the container with cron.
2. How to verify that cron tasks are executing and output is being written to the file `/var/log/cron.log`.
3. Description of the project structure and purpose of each file.

## Submission

Upload the script to a GitHub repository and provide a link to it.

## Grading

| Criterion                                  | No  | Partially | Yes  |
| ------------------------------------------ | --- | --------- | ---- |
| Requirements fulfillment                   | 0   | 50        | 100  |
| Code is well-structured and commented      | 0   | 20        | 40   |
| Error handling                             | 0   | 10        | 20   |
| Logging and notifications                  | 0   | 10        | 20   |
| Documentation and usage examples          | 0   | 10        | 20   |
| Per day late                               | 0   | 0         | -20  |
| Plagiarism                                 | 0   | 0         | -100 |
| **Total**                                  |     |           | 200  |
