# Backup-Aplus

This is the repository for the A+ related with MongoDB backup and its upload to S3.

This container and the container of the database must be inside the same docker network.

To run this container, execute the following command:

docker run --name backup -d --env AWS_ACCESS=<YOUR_AWS_ACCESS_KEY> --env AWS_SECRET=<YOUR_AWS_SECRET_KEY> --env DB_CONTAINER=<YOUR_DB_CONTAINER_NAME> --env DB_PORT=<YOUR_DB_PORT> --env DB_NAME=<YOUR_DB_NAME> --env S3_BUCKET_NAME=<YOUR_S3_BUCKET_NAME> --env CRON_EXPRESSION=<YOUR_CRON_EXPRESSION> juablafer/test-cron

An example of CRON_EXPRESSION can be: "55 17 * * *", which will run the backup every day at 17:55 UTC