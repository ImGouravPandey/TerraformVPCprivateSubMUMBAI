# Set the region and availability zone
resource "aws_region" "mumbai" {
  region = "ap-south-1"
}

resource "aws_availability_zone" "mumbai_az1" {
  name = "ap-south-1a"
  region = "${aws_region.mumbai.name}"
}

# Create the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my_vpc"
  }
}

# Create the private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "${aws_availability_zone.mumbai_az1.name}"
  tags = {
    Name = "private_subnet"
  }
}
