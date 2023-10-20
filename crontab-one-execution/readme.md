# crontab-one-execution

This directory contains a script to simplify scheduling cron tasks on Unix-based systems. The `crontab-one-execution.sh` script allows you to schedule the execution of a command at a specific time.

## Use

````tap
./crontab-one-execution.sh command minutes hours day month
````

## Example

````tap
./crontab-one-execution.sh "sudo service web restart" 0 7 19 10
````

This example runs the command "sudo service web restart" at 7:00 AM. m. on October 19.

##Requirements

- The script requires to be run in a Unix environment with access to crontab.

## Parameters

- `command`: The command to be executed.
- `minutes`: Minute in which the command will be executed (0-59).
- `hours`: Time when the command will be executed (0-23).
- `day`: Day of the month in which the command will be executed (1-31).
- `month`: Month in which the command will be executed (1-12).

## Validations

- Validations are carried out to ensure that the parameters are numbers and are within the appropriate ranges.

## Functionalities

- The script shows the current entries in the cron table.
- Create a new cron entry with the provided command.
- Delete any previously existing entry equal to the new one.
- Add the new entry to the cron table.

## Advanced use

You can integrate this script into your workflows or scripts to schedule specific tasks at a specific time.

##Contributions

If you find any issues or have improvements to suggest, feel free to open an issue or submit a pull request!