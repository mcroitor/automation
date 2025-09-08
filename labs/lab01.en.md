# IW01: Writing a Simple Shell Script for Task Automation

## Objective

Learn to create and execute simple Shell scripts to automate routine tasks in the Linux operating system.

## Task

Automate one of the following tasks using a Shell script:

1. Creating a backup of an important directory:
   1. The script should be named `backup.sh`;
   2. The script should take two arguments: the path to the directory to back up and the path to the directory to save the backup;
   3. The second argument should be optional and default to the directory `/backup`;
   4. The script should create a `tar.gz` archive with the current date in the filename;
   5. The script should check that the specified directories exist and output appropriate error messages.
2. Cleaning up temporary files:
   1. The script should be named `cleanup.sh`;
   2. The script should take at least one argument: the path to the directory to clean up;
   3. The remaining arguments are optional and specify the types of files to delete (e.g., `.tmp`, `.log`);
   4. By default, files with the `.tmp` extension are deleted;
   5. At the end of the script execution, it should output the number of deleted files;
   6. The script should check that the specified directory exists and output appropriate error messages.
3. Monitoring disk space usage of a directory:
   1. The script should be named `disk_usage.sh`;
   2. The script should take two obligatory arguments: the path to the directory to monitor and the max volume reserved for directory in megabytes;
   3. The third optional argument presents the threshold value for disk space usage in percent, default value to 80%;
   4. If the disk space usage exceeds the threshold value, the script should send a notification to the specified email;
   5. The script should output the current disk space usage in percent for the specified directory to the file `disk_usage.log`;
   6. The script should check that the specified directory exists and output appropriate error messages.

## Presentation

Upload the script to a GitHub repository and provide a link to it.

## Evaluation

| Criterion                                   | Points  |
| ------------------------------------------- | ------- |
| The script meets all requirements           | 70      |
| The code is well-structured and commented   | 20      |
| The script runs successfully without errors | 10      |
| **Total**                                   | **100** |
