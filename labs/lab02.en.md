# IW02: Creating a Python Script to Interact with an API

## Goal

Learn to interact with a Web API using a Python script.

## Preparation

Download the project attached to this assignment and unpack it in a convenient location. Start the service using the instructions in the `README.md` file.

## Task

In the `automation` project, create a branch called `lab02`. Create a directory named `lab02`. Inside it, create a file called `currency_exchange_rate.py`.

Write a Python script (`currency_exchange_rate.py`) that will interact with the service API. The script must perform the following functions:

1. Get the exchange rate of one currency against another on a specified date. The currencies and date must be passed as command-line parameters.
2. Save the received data to a file in JSON format. The file name must include the currencies and the request date. Save the file in a `data` directory, which must be created in the root of the project if it does not already exist.
3. Handle errors that occur when making requests to the API (e.g., invalid parameters). Display clear error messages in the console and save them to a log file `error.log` in the root of the project.

Test the script by running it with different parameters. Data period: from `2025-01-01` to `2025-09-15`.

Run the script for dates within your chosen range (at least 5 dates, with equal intervals).

Create a file `readme.md` and describe:

- How to install the necessary dependencies to run the script;
- How to run the script with command examples;
- How the script is structured (main functions and logic).

## Presentation

Upload the script to a GitHub repository and provide a link to it.

## Evaluation

| Criterion                                   | No  | Partial | Yes  |
| ------------------------------------------- | --- | ------- | ---- |
| The script meets all requirements           | 0   | 50      | 100  |
| The code is well-structured and commented   | 0   | 20      | 40   |
| The script runs successfully without errors | 0   | 10      | 20   |
| Logging and notifications                   | 0   | 10      | 20   |
| Documentation and usage examples            | 0   | 10      | 20   |
| Each day late                               | 0   | 0       | -20  |
| Plagiarism                                  | 0   | 0       | -100 |
| **Total**                                   |     |         | 200  |
