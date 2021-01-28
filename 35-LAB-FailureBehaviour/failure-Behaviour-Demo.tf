terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.8.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
  
 
}

/* Requirement:

    1. Install Vim editor after creation of EC2
    2. Uninstall Vim before deleting EC2 instance
*/



resource "aws_security_group" "allowssh" {
  name="allowssh"
  description = "Allow SSH inboud traffice"

  ingress {
    description = "SSH into our VPC"
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  } 

  
}

resource "aws_instance" "devbox" {
   ami = "ami-0c94855ba95c71c99"
   instance_type = "t2.micro"
   key_name = "tfkey"
   vpc_security_group_ids  = [aws_security_group.allowssh.id]

  provisioner "remote-exec" {
    on_failure = continue
   inline=[
     "sudo yum -y install vim"
   ]
  }

  provisioner "remote-exec" {
    when= destroy
    inline=[
      "sudo yum -y remove vim"
    ]
  
  }
   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./tfkey.pem")
     host = self.public_ip
   }
}