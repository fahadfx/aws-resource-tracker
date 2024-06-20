#!/bin/bash

#####################################################################################################################################################################
# Author: MOHAMMED FAHAD A
# Version: V1
# Subject: This script will report the AWS resource usage
######################################################################################################################################################################
# AWS s3
# AWS Ec2
# AWS Lambda
# AWS IAM Users

# Enable debugging
set -x

# Define the log file path
LOG_FILE="$HOME/aws_resource_report.log"

# Create/Truncate the log file and set permissions
> $LOG_FILE
chmod 644 $LOG_FILE

# List the S3 buckets
echo "s3 bucket list" >> $LOG_FILE
aws s3 ls >> $LOG_FILE

# List the EC2 instances
echo "ec2 Instances list" >> $LOG_FILE
aws ec2 describe-instances \
           --filters Name=instance-state-name,Values=running \
       --query "Reservations[*].Instances[*].{InstanceId:InstanceId,State:State.Name,InstanceType:InstanceType,LaunchTime:LaunchTime,PublicIpAddress:PublicIpAddress,Tags:Tags}">> $LOG_FILE
# List the Lambda functions
echo "lambda functions list" >> $LOG_FILE
aws lambda list-functions >> $LOG_FILE

# List the IAM users
echo "Iam users list" >> $LOG_FILE
aws iam list-users >> $LOG_FILE





