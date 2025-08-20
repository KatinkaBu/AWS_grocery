resource "aws_instance" "grocerymate_ec2" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id     = var.subnet_id
  key_name      = "grocerymate-ec2"
  tags = {
    Name = "grocerymate-ec2-tf"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "grocerymate-ec2-sg-tf"
  description = "Allow SSH and HTTP for EC2"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
