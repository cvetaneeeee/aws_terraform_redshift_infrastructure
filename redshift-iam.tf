# Create an IAM Role for Redshift
resource "aws_iam_role" "redshift-serverless-role" {
  name = "<some name>"

assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name        = "<some tag>"
    Environment = var.app_environment
  }
}

# Create and assign an IAM Role Policy to access S3 Buckets
resource "aws_iam_role_policy" "redshift-s3-full-access-policy" {
  name = "<some name>"
  role = aws_iam_role.redshift-serverless-role.id

policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Action": "s3:*",
       "Resource": "*"
      }
   ]
}
EOF

}

# Get the AmazonRedshiftAllCommandsFullAccess policy
data "aws_iam_policy" "redshift-all-commands-full-access-policy" {
  name = "AmazonRedshiftAllCommandsFullAccess"
}

# Attach the AmazonRedshiftAllCommandsFullAccess policy to the Redshift role
resource "aws_iam_role_policy_attachment" "attach-all-commands" {
  role       = aws_iam_role.redshift-serverless-role.name
  policy_arn = data.aws_iam_policy.redshift-all-commands-full-access-policy.arn
}

# Attach the AmazonRedshiftFullAccess policy to the Redshift role
resource "aws_iam_role_policy_attachment" "attach-full-access" {
  role       = aws_iam_role.redshift-serverless-role.name
  policy_arn = data.aws_iam_policy.redshift-full-access-policy.arn
}

# Get the AmazonRedshiftAllCommandsFullAccess policy
data "aws_iam_policy" "redshift-data-full-access-policy" {
  name = "AmazonRedshiftDataFullAccess"
}

# Attach the AmazonRedshiftFullAccess policy to the Redshift role
resource "aws_iam_role_policy_attachment" "attach-data-access" {
  role       = aws_iam_role.redshift-serverless-role.name
  policy_arn = data.aws_iam_policy.redshift-data-full-access-policy.arn
}