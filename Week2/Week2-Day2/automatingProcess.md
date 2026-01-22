# Automate backup and threshhold check process

## what is cron used for?
It is a time based job scheduler in unix like system 

1. open user crontab -e 
command: crontab -e

2. add the cron entry
 m h  dom mon dow   command
 0 7 * * * /path/ 

3. Automating scripts
command: sudo crontab -e

4. Add cron entries
0 7 * * * /mnt/c/Users/logupriya.a/devops_logupriyaa/Week2/Week2-Day2/backupHome.sh
0 7 * * * /mnt/c/Users/logupriya.a/devops_logupriyaa/Week2/Week2-Day2/thresholdCheck.sh

5. verify cron jobs
command: sudo crontab -l

output:
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command
0 7 * * * /mnt/c/Users/logupriya.a/devops_logupriyaa/Week2/Week2-Day2/backupHome.sh

0 7 * * * /mnt/c/Users/logupriya.a/devops_logupriyaa/Week2/Week2-Day2/thresholdCheck.sh

m - every minute
h - time
dom - every day of month
mon - every month of year
dow - every day of week
/path/ - path of the task which needs to be automated