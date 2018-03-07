resource "aws_vpc" "packer" {
    cidr_block           = "192.168.12.0/24"
    enable_dns_hostnames = false
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "packer"
    }
}

resource "aws_subnet" "subnet-663afa00-packer" {
    vpc_id                  = "vpc-1f8d3a79"
    cidr_block              = "192.168.12.0/27"
    availability_zone       = "eu-west-1b"
    map_public_ip_on_launch = false

    tags {
        "Name" = "packer"
    }
}

resource "aws_route_table" "rtb-42dc1d3b" {
    vpc_id     = "vpc-1f8d3a79"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "igw-4546d022"
    }

    tags {
        "Name" = "packer"
    }
}


