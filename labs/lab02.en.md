# IW02: Creating a Python Script to Interact with an API

## Goal

Learn to interact with a Web API using a Python script.

## Preparation

Download the project attached to this assignment and unpack it in a convenient location. Start the service using the instructions in the `README.md` file.

## Task

In the `automation` repository, create a branch called `lab02`. Create a directory named `lab02`. Inside it, create a file called `currency_exchange_rate.py`.

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

## Requirements

1. Create branch `lab02`;
2. In this branch create `lab02` folder;
3. In the `lab02` folder create the necessary by the task script;
4. In the `lab02` folder create `README.md` file with the script description (what script do, how to use it) with usage examples;
5. Send the project to the server and merge changes to the main branch.

## Presentation

Upload the script to a GitHub repository and provide a link to it.

## Evaluation

Each criterion is evaluated on a five-level scale: 0%, 25%, 50%, 75%, or 100%.

| ID | Criterion | Weight `q_i` | Penalty `D_i` | 0% | 25% | 50% | 75% | 100% | Notes |
| -- | --------- | ------------ | ------------- | -- | --- | --- | --- | ---- | ----- |
| C-1 | Forms and executes an HTTP request to the currency exchange rate API for a given currency pair and date | 1 | 0 | HTTP request is missing or points to the wrong endpoint | Request exists but does not pass currencies and/or date, rate is not extracted | Request is executed, response received, but rate is parsed incorrectly or base and target currencies are swapped | Request is correct for a typical case, response parsing is correct, some edge cases are not handled | Exchange rate for the currency pair on the given date is requested and correctly extracted for all tested pairs | — |
| C-2 | Accepts currencies and date from command line arguments | 1 | 0 | Values are hardcoded or requested interactively | Only part of the parameters is read (only currencies or only date) | All three values are read, but parameter names/order are unclear and not documented | Parameters have clear names, values are partially validated | Currencies and date are passed as command line arguments, validated, incorrect input is rejected with a message | Check running without arguments |
| C-3 | Saves the API response to a JSON file in the `data` directory in the project root | 1 | 0 | File is not saved or not in JSON format | JSON is saved, but `data` directory is not created or path is not in project root | File is saved in `data`, but name does not include currencies or date | Name includes currencies and date, directory is created if missing; rerun and special characters not checked | JSON file with name including both currencies and date is created in `data/`, directory is created automatically | Check contents of `data/` after run |
| C-4 | Handles API errors and displays informative messages in the console | 1 | 0 | Errors are not handled, script ends with traceback | Handling exists but message is uninformative or loses the cause | Error is caught and displayed without currency pair/date and without distinguishing error types | Message is informative for invalid parameters, some scenarios (network, 5xx) not covered | Invalid parameters, service unavailability, and incorrect response are handled, message contains cause and request context | Check running with invalid date and non-existent currency |
| C-5 | Writes errors to the `error.log` file in the project root | 1 | 0 | Error logging is missing | Log file is created, but entries do not match the errors that occurred | Errors are logged, but file is not in project root or entries lack time and context | All caught errors go to `error.log` with request context | `error.log` in project root contains an entry for each handled error with date, parameters, and error text | Compare console output and `error.log` |
| C-6 | Runs for the selected date range | 1 | 0 | Run not performed, no artifacts | Less than 5 dates or dates outside the period 2025-01-01…2025-09-15 | 5 dates exist, but interval between them is uneven | At least 5 dates with equal interval, single runs ended with error | At least 5 dates with equal interval in the specified period, all runs successful, result confirmed by files in `data/` | Count by files in `data/` |
| C-7 | Documents installation of dependencies, script execution and structure in `readme.md` | 1 | 0 | `readme.md` is missing | Only one of the three points is described | Two of the three points are described or command examples are not working | All three points are present, but function description is superficial | `readme.md` contains commands for installing dependencies, working examples of execution and description of main functions and logic | — |
| C-8 | Delivery formatting: branch `lab02`, folder `lab02`, file `currency_exchange_rate.py`, GitHub link | 1 | 0 | File is missing or not in the required location, link is missing | Script exists, but folder structure or branch does not match the task | Structure is correct, but repository is not published or link is not working | Everything is placed correctly, link opens, but branch is not named `lab02` | Branch `lab02` contains `lab02/currency_exchange_rate.py`, script is available at the provided link | — |
| C-9 | Meets the deadline — penalty criterion: `q_i = 0`, not included in weighted average | 0 | 20 | Delay of 7 days or more | Delay of 5–6 days | Delay of 3–4 days | Delay of 1–2 days | Work submitted on time or earlier | `D_i` × number of days of delay is deducted from the final score; if delay is 0 days, no penalty is applied |

Final score in percent: `G = max(0, (Σ P_i · q_i) / Σ q_i - 20 · k)`, where `P_i` is the score for the criterion in percent (0, 25, 50, 75, or 100), `k` is the number of days of delay.
