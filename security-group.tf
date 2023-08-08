resource "aws_security_group" "redshift-serverless-security-group" {
  depends_on = [aws_vpc.redshift-serverless-vpc]

  name        = "<some name>"
  description = "<some description>"

  vpc_id = aws_vpc.redshift-serverless-vpc.id
  
  ingress {
    description = "some service"
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["<host address>", "<host address>", "<host address>"]
  }

  ingress {
    description = "local dev to AWS"
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["<your IP>", "<another IP>"]
  }

  ingress {
    description = "self-reference"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "<some tag>"
    Environment = var.app_environment
  }
}