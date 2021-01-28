resource "aws_security_group" "sgmultiport"{

    name="withoutDynamicBlockSG"

    ingress{
        from_port=7900
        to_port=7900
        protocol="tcp"
        cidr_blocks=["10.0.0.0/24"]
    }

    ingress{
        from_port=5234
        to_port=5234
        protocol="tcp"
        cidr_blocks=["10.0.0.0/24"]
    }
    ingress{
        from_port=6300
        to_port=6300
        protocol="tcp"
        cidr_blocks=["10.0.0.0/24"]
    }
    ingress{
        from_port=6006
        to_port=6006
        protocol="tcp"
        cidr_blocks=["10.0.0.0/24"]
    }
    ingress{
        from_port=9009
        to_port=9009
        protocol="tcp"
        cidr_blocks=["10.0.0.0/24"]
    }
}