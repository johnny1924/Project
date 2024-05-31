resource "aws_instance" "ec2" {
  ami           = "ami-04b70fa74e45c3917" 
  instance_type = "t2.medium"
  key_name      = "ec2project"
  vpc_security_group_ids = [aws_security_group.ssh-sg.id]
  subnet_id      = aws_subnet.tf-public-us-east-1a.id  
  associate_public_ip_address = true

  tags = {
    Name = "tf-webServer-Ubuntu"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo snap install docker
    sudo systemctl start docker
  EOF

#  provisioner "remote-exec" {
#    inline = [ "sudo apt update","sudo snap install docker",
#    "sudo docker run -p 80:8080 -p 50000:50000 -d jenkins/jenkins" ]
#  }
#connection {
#  type = "ssh"
#  host = self.public_ip
#  user = "ubuntu"
#  private_key = file("/Users/saharvahaba/Downloads/ec2project.pem")
#}

#  key_name               = "ec2project"
#  vpc_security_group_ids = [aws_security_group.ssh-sg.id]
}

resource "aws_security_group" "ssh-sg" {
  name        = "tf-ssh-access"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_vpc.tf_project_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-sg"
  }
}
