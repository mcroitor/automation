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

Each criterion is scored on a 5-level scale: 0%, 25%, 50%, 75% or 100%.

| ID | Criterion | Weight `q_i` | Penalty `D_i` | 0% | 25% | 50% | 75% | 100% | Notes |
| -- | --------- | ------------ | ------------- | -- | --- | --- | --- | ---- | ----- |
| **C1** | Defines cron schedules for both required jobs | 3 | 0 | `cronjob` is missing or contains no runnable entry | Both entries exist, but neither matches its required expression, currency pair or period | Exactly one job is fully correct; the other has a wrong expression, pair or period | Both jobs have the correct expression and period, but output redirection or one script argument deviates | `0 6 * * *` (MDL→EUR, previous day) and `0 17 * * 5` (MDL→USD, previous week) are present, arguments match, output goes to `/var/log/cron.log` | Compare against the two expressions in the Assignment |
| **C2** | Containerizes cron in a buildable `Dockerfile` | 3 | 0 | `Dockerfile` is missing, or the image does not build | The image builds and at most 2 of the 5 required items are met | The image builds and 3 of the 5 required items are met | The image builds and 4 of the 5 required items are met | The image builds and all 5 items are met: dependencies installed, script + `cronjob` + entrypoint copied, cron configured for `cronjob`, cron started in background, output to `/var/log/cron.log` | Count items by executing `docker build` and reading the `Dockerfile` |
| **C3** | Orchestrates the container with Compose | 1 | 0 | `docker-compose.yml` is missing or invalid, or `docker compose up --build` fails | Compose file exists, but the build fails or targets a `Dockerfile` outside `lab03` | `docker compose up --build` builds the image, but the container exits immediately or never starts cron | Container builds from the `lab03` `Dockerfile` and stays running, but the entrypoint or command bypasses cron | `docker compose up --build` builds from the `lab03` `Dockerfile`, and the container stays running with cron as the foreground process | Check `docker compose ps` after startup |
| **C4** | Provides verifiable evidence of scheduled execution in `/var/log/cron.log` | 2 | 0 | No evidence submitted, or the log contains no cron output | The log exists but holds only startup messages, no job output | The log shows output from one job only, or only from a manual run | The log shows output from both jobs, but one entry lacks a timestamp or the retrieved rate | The log shows output from both jobs with timestamps and retrieved exchange rates | A temporary schedule or manual trigger is accepted for the Friday job |
| **C5** | Documents build/run, log verification and project structure in `readme.md` | 1 | 0 | `readme.md` is missing or covers none of the 3 required parts | 1 of the 3 required parts is present, with commands that do not work as written | 2 of the 3 required parts are present | All 3 parts are present, but a command or file description is inaccurate | All 3 parts are present and every command works as written: build and run, output verification, structure and file purposes | Execute the documented commands while grading |

Definitions:

- **Correct job (C1):** the expression is `0 6 * * *` (daily, MDL to EUR, previous day) or `0 17 * * 5` (weekly, MDL to USD, previous week); the `currency_exchange_rate.py` arguments match that currency pair and period; the output goes to `/var/log/cron.log`.
- **Dockerfile items (C2):** the five items listed in the Assignment (install dependencies; copy the script, `cronjob` and the entrypoint script; configure cron to use `cronjob`; run cron in the background at container start; write cron output to `/var/log/cron.log`).
- **Evidence (C4):** a log excerpt or screenshot. A temporarily changed schedule or a manual trigger is accepted, because the weekly job runs only on Fridays.
- **Required readme parts (C5):** the three items listed in the Assignment (build and run; verification of cron output; project structure and file purposes).

Final score, in percent:

`G = max(0, (Σ P_i * q_i) / (Σ q_i) - 20 * k - 100 * p)`

where `P_i` is the criterion score in percent (0, 25, 50, 75 or 100), `Σ q_i = 10`, `k` is the number of days late, and `p = 1` if plagiarism is confirmed (otherwise `p = 0`).

| Penalty      | Value (%) |
| ------------ | --------- |
| Per day late | -20%      |
| Plagiarism   | -100%     |
