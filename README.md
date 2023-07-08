# Cronjob/Crontab Shell Scripting
## Problem:
This assignment involves scheduling a shell script to run periodically every minute. You can achieve this in
the Unix/Linux system using the Cron job/Crontab.
Write a shell script that dynamically creates a text file (one per cron job execution) capturing the current
running processes information using “ps -aux command”. The text file must contain the contents in sorted
fashion of ascending order of memory consumption (column number: 4) with only information of the last 5
processes (5 processes that consume highest memory) per .txt file. Schedule this script to run as a cron job
that executes every minute. Mention the command to schedule the cron job as comments at the top of your
shell script.
Further, in every fourth execution of your shell script, consider the text files of previous three executions
and find the process that has consumed the highest amount of total memory in the last three minutes. Create
a file named - “memory log.txt”. Append the file with the following single line entry:
Current timestamp process name process id total memory consumed in last three minutes.
After the fourth execution, keep over-writing the process data into the files already created.
Note:
• Three files must be created to hold “ps” command output with names as File1.txt, File2.txt, File3.txt.
• The file ”memory log.txt” must only be create at the fourth execution of the shell script.
• Code must handle if files are already existing.

## How The Program Runs:
My path location is different like "/mnt/drive/folder/filename" because I've used Windows Subsystem for Linux which gives Linux(Terminal) environment on Windows.
So its just path location need to be changed if run on a pure Ubuntu machine, as my path is "/mnt/e/Shell/myfile.sh". So in a pure Ubuntu machine it will be like "/home/user/myfile.sh".
I've used variable.txt file in my shell script which has my global counter as 1 to maintain the creation of 3 instances for File.txt.
