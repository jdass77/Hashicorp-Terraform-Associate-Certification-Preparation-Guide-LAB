# terraform
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
# provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
# resource s3
resource "aws_s3_bucket" "demobuckets3" {
  bucket = "cloudpragati-demo14589"
}


#output
output "demobucket_output" {
  value = aws_s3_bucket.demobuckets3
}

#output
output "demospecific_attribute" {
  value = aws_s3_bucket.demobuckets3.bucket_regional_domain_name
}
