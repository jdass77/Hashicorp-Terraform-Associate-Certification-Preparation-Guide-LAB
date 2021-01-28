resource "aws_instance" "ec2instance"{
    ami ="ami-0c94855ba95c71c99"
    instance_type=var.instancetype
}