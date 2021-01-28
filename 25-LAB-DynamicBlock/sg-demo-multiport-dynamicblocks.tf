

resource "aws_security_group" "dsgmultiport"{

    name="withDynamicBlockSG"

   dynamic "ingress" {
       for_each=var.allports
       iterator = port
       content{
        from_port=port.value
        to_port=port.value
        protocol="tcp"
        cidr_blocks=["10.0.0.0/24"]
        }
    }
}