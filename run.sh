#!/bin/bash

timestamp_start=`date +%Y-%m-%d_%H-%M-%S`
echo "Cron job started at $timestamp_start"

echo "Creating backup..."
mongodump --uri mongodb://reviews-db:27017/acme-explorer -o /backup
echo "Backup generated successfully"

echo "Uploading backup to S3"
aws s3 cp /backup/acme-explorer/ s3://acme-explorer-db-backup/backup-$timestamp_start/ --recursive
echo "Backup uploaded successfully"

timestamp_end=`date +%Y-%m-%d_%H-%M-%S`
echo "Cron job finished at $timestamp_end"