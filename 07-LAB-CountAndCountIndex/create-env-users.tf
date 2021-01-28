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
  version=3.6
}

/* Requirement : Create 3 IAM user called 
    1. User1
    2. User2
    3. User3
*/

resource "aws_iam_user" "allUserList"{
  name=var.allUserList[count.index]
  count=length(var.allUserList)
  path="/system/"
}

