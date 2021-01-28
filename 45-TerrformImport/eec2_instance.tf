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
}

resource "aws_instance" "devbox" {
  ami           = "ami-04bf6dcdc9ab498ca"
  instance_type = "t2.micro"
  vpc_security_group_ids=["sg-0e75700bcaa8a7475"]

  key_name="tfimportdemo"
  subnet_id="subnet-e70f28c9"

 
}
