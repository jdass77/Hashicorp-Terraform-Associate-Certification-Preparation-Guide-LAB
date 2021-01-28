output "VPCID" {
  value = "${aws_vpc.default.id}"
}

output "PublicSubnetID" {
  value = "${aws_subnet.public-subnet.id}"
}

output "PrivateSubnetID" {
  value = "${aws_subnet.private-subnet.id}"
}

output "InternetGatewayID" {
  value = "${aws_internet_gateway.igw.id}"
}

output "RouteTableID" {
  value = "${aws_route_table.web-public-rt.id}"
}

output "SecurityGroupID" {
  value = "${aws_security_group.sgweb.id}"
}

output "ECInstanceIP" {
  value = "${aws_instance.wb.public_ip}"
}