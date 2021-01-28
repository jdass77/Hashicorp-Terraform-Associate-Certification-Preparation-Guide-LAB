terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
  version=3.6
}

/* Requirement : Create Environment As Per Specified Value. If user
Specify PROD then t2.xlarge instance get created else t2.micro gets 
Created

New Requirement : Tag all the Instance with Project Details as follow
 1. Project UID
 2. Project Name
 3. Project Team 

*/

locals {
  ctags={
ProjectUID="1234"
ProjectName="XYZ"
ProjectTeam="DevOps Team"
  }
}
resource "aws_instance" "PROD"{
  ami="ami-0c94855ba95c71c99"
  instance_type="t2.xlarge"
  count=var.env=="PROD" ? 1 : 0

  tags=local.ctags
}

resource "aws_instance" "DEV"{
  ami="ami-0c94855ba95c71c99"
  instance_type="t2.micro"
  count=var.env=="DEV" ? 1 : 0
   tags=local.ctags
}
