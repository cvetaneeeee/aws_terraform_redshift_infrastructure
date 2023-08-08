terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
  backend "s3" {
    bucket = "<bucket name>"
    key    = "<key name>"
    region = "<region name>"
  }
}

provider "aws" {
  region = "<region name>"
}