resource "aws_internet_gateway" "project-igw" {
  vpc_id = aws_vpc.tf_project_vpc.id
  tags = {
    Name = "tf-project-igw"
  }
}
