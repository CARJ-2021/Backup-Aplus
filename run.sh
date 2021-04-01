#!/bin/bash

timestamp_start=`date +%Y-%m-%d_%H-%M-%S`
echo "Cron job started at $timestamp_start"

echo "Creating backup..."
mongodump --uri mongodb://$DB_CONTAINER:$DB_PORT/$DB_NAME -o /backup
echo "Backup generated successfully"

echo "Uploading backup to S3"
aws s3 cp /backup/$DB_NAME/ s3://$S3_BUCKET_NAME/backup-$timestamp_start/ --recursive
echo "Backup uploaded successfully"

timestamp_end=`date +%Y-%m-%d_%H-%M-%S`
echo "Cron job finished at $timestamp_end"