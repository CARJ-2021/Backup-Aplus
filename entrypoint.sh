#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

# Setup AWS CLI configuration
aws --profile default configure set aws_access_key_id "$AWS_ACCESS"
aws --profile default configure set aws_secret_access_key "$AWS_SECRET"

# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env
$CRON_EXPRESSION /run.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f