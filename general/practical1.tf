provider "aws" {

  region = "us-west-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myweb" {
   ami = "ami-bf5540df"
   instance_type = "t2.micro"
   security_groups = ["${aws_security_group.mysg.name}"]

   tags {
      Name = "web-server"
  }

}

resource "aws_security_group" "mysg" {
  name = "web-server-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["116.75.30.5/32"]
  }

  ingress {
    from_port   = 21
    to_port     = 21
    protocol    = "tcp"
    cidr_blocks = ["116.75.30.5/32"]
  }

  ingress {
    from_port   = 25
    to_port     = 25
    protocol    = "tcp"
    cidr_blocks = ["116.75.30.5/32"]
  }
}

resource "aws_eip" "myeip" {
  instance = "${aws_instance.myweb.id}"
}