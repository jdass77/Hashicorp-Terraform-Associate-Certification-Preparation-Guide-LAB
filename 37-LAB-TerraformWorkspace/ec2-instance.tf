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
  ami           = "ami-0c94855ba95c71c99"
  instance_type = lookup(var.instancetype,terraform.workspace)
}

/*Requirement 

Dev Workspace - t2.micro
Test Workspace -t2.small
Prod Workspace -t2.large

*/

variable instancetype{
  type=map(string)

  default ={
    default="t2.nano"
    dev="t2.micro"
    test="t2.small"
  }
}
