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

/* Requirement:

    Project "Redclif" Required  Web-server on AWS with nginx installed.

    Once Web-server created they want Private IP of server
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

   egress {
    description = "Outbound"
    from_port=0
    to_port=65535
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  } 
}

resource "aws_instance" "devbox" {
  ami="ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  key_name = "tfkey"

  provisioner "remote-exec" {

    connection{
      type="ssh"
      user="ec2-user"
      private_key= file("./tfkey.pem")
      host=self.public_ip
    }
    inline =[
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
  
  }

  provisioner "local-exec" {
  
    command="echo ${aws_instance.devbox.private_ip} >> private_ips.txt"
  }
}