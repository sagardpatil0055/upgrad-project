
resource "aws_instance" "bastion" {
  ami                         = "ami-020cba7c55df1f615"
  instance_type               = "t2.small"
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  associate_public_ip_address = true
  key_name                    = "project"
  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "app" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t2.small"
  subnet_id              = aws_subnet.private[0].id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = "project"
  tags = {
    Name = "app"
  }
}

resource "aws_instance" "jenkins" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t2.small"
  subnet_id              = aws_subnet.private[1].id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = "project"
  tags = {
    Name = "jenkins"
  }
}
