resource "aws_eip" "tf-nat" {
  vpc = true
  tags = {
    Name = "tf-nat"
  }
}

resource "aws_nat_gateway" "project-nat" {
  allocation_id = aws_eip.tf-nat.id
  subnet_id = aws_subnet.tf-public-us-east-1a.id
  tags = {
    Name = "tf-project-nat"
  }
  depends_on = [ aws_internet_gateway.project-igw ]
}
