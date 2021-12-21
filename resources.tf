resource "aws_key_pair" "key_pair" {
  key_name    = var.key_name
  public_key  = var.public_key
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "allow_ssh" {
  name   = "sg_ssh"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks    = ["0.0.0.0/0"]
  }
}