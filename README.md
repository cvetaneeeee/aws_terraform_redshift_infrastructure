# aws_terraform_redshift_infrastructure
terraform module that creates VPC and Redshift Serverless Architecture

This architecture creates a VPC with 3 availability zones and a secutity group,
configures iam roles for access and adds a psycopg2 layer for python scripting in
lambda (for example for moving data from s3 to redshift with event notifications
that trigger the lambda function)
