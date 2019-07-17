resource "aws_instance" "myapp" {
   ami = "ami-bf5540df"
   instance_type = "t2.micro"
   security_groups = ["${aws_security_group.myappsg.name}"]

   tags {
      Name = "app-server"
  }

}

resource "aws_security_group" "myappsg" {
  name = "app-server-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]
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

resource "aws_eip" "myappeip" {
  instance = "${aws_instance.myapp.id}"
}