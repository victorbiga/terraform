# Configure the AWS Provider
provider "aws" {
  region     = "us-west-2"
}

# Create a VPC
resource "aws_VPC" "web" {
    cidr_block  = "192.168.0.0/16"
    instance_tenancy = "default"

    tags {
      Name = "main"
      Location = "London"

    }
}

# Create network subnet
resource "aws_subnet" "subnet1" {
  vpc_id = "${aws_VPC.main.id}"
  cidr_block = "192.168.1.0/24"

  tags {
    Name = "Subnet1"
  }
}


