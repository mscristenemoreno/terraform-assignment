module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair.key_name
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = "subnet-67cc7401"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}