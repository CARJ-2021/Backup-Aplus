# Backup-Aplus

This is the repository for the A+ related with MongoDB backup and its upload to S3.

To run this container, execute the following command:

docker run --name backup -d --env AWS_ACCESS=<YOUR_AWS_ACCESS_KEY>--env AWS_SECRET=<YOUR_AWS_SECRET_KEY> juablafer/test-cron