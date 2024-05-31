resource "aws_vpc" "tf_project_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name ="tf_project_vpc"
  }
}
