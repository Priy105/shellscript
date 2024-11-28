#!/bin/bash


###################################################################################
#This script list the AWS resources used by the account.
#Author : Priyanka
#Date: Nov 27, 24
#Version : 1
#
#Services to be supported in this script:
#EC2, S3, RDS, DynamoDB, Lambda, EBS, ELB, CloudFront, SNS, SQS, Route53, VPC, CloudFormation, IAM
#
#Usage: ./aws_resource_list.sh <region> <servicename>
#
####################################################################################
#
#
#

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
	echo "Uage: $0 <region> <servicename>"
	exit 1
fi

#assign the agruments to variables and convert the service to lowercase
aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')

#Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
	echo "AWS CLI is not installed. Please install the AWS CLI and then try again"
	exit 1
fi

# Check if AWS CLI is configured
if [ ! -d ~/.aws ]; then
	echo "AWS CLI is not configured. Please configure AWS CLI and then try again."
exit 1
fi

# List the resources based on the service
case $aws_service in
	ec2)
		echo "Listiong EC2 instances in $aws_region"
		aws ec2 describe-instances --region $aws_region
		;;
	rds)
		echo "Listiong RDS instances in $aws_region"
                aws rds describe-db-instances --region $aws_region
                ;;
	s3)
                echo "Listiong S3 busckets in $aws_region"
                aws s3api list-buckets --region $aws_region
                ;;
	cloudfront)
                echo "Listing CloudFront Distributions in $aws_region"
                aws cloudfront list-distributions --region $aws_region
                ;;
	vpc)
                echo "Listing VPCs in $aws_region"
                aws ec2 describe-vpcs --region $aws_region
                ;;
	iam)
                echo "Listing IAM users in $aws_region"
                aws iam list-users --region $aws_region
                ;;
	route5)
                echo "Listing Route53 Hosted Zones in $aws_region"
                aws route53 list-hosted-zones --region $aws_region
                ;;
 	cloudwatch)
                echo "Listing CloudWatch alarms in $aws_region"
                aws cloudwatch describe-alarms --region $aws_region
                ;;
	cloudformation)
                echo "Listing CloudFormation stacks in $aws_region"
                aws cloudformation describe-stacks --region $aws_region
                ;;
	lambda)
                echo "Listing Lambda Functions in $aws_region"
                aws lambda list-functions --region $aws_region
                ;;
	sns)
                echo "Listing SNS Topics in $aws_region"
                aws sns list-topics --region $aws_region
                ;;
	sqs)
                echo "Listing SQS Queues  in $aws_region"
                aws sqs list-queues --region $aws_region
                ;;
	dynamodb)
                echo "Listing DynamoDB Tables in $aws_region"
                aws dynamodb list-tables --region $aws_region
                ;;
	ebs)
                echo "Listing EBS Volumes in $aws_region"
                aws ec2 describe-volumes --region $aws_region
                ;;
	*)
		echo "Invalid Service. Please enter a valid service."
		exit 1
		;;
esac










