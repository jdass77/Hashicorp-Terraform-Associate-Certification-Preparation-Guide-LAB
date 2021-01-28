terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}



provider "aws" {
  profile = "default"
  region  = "us-east-1"
  version="3.6"
}