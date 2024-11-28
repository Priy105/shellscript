#!/bin/bash

####################################################
# Author : Priyanka
# Date : 26 Nov 24
# Version : 1
# This script will report the AWS usage.
####################################################


# AWS s3, ec2, lambda, iam users

set -x

# list s3 buckets
echo "Print s3 buckets info"
aws s3 ls | ts '[%Y-%m-%d %H:%M:%S]' >> awsResourcefile

# list EC2 instances
echo "Print ec2 info"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' | ts '[%Y-%m-%d %H:%M:%S]' >> awsResourcefile

# list aws lambda
echo "Print aws lambda info"
aws lambda list-functions | ts '[%Y-%m-%d %H:%M:%S]' >> awsResourcefile

#list iam users
echo "Print iam users info"
aws iam list-users | ts '[%Y-%m-%d %H:%M:%S]' >> awsResourcefile

