resource "aws_subnet" "tf-private-us-east-1a" {
  vpc_id            = aws_vpc.tf_project_vpc.id
  cidr_block        = "192.168.0.0/19" #8192
  availability_zone = "us-east-1a"

  tags = {
    Name                              = "private-us-east-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}
resource "aws_subnet" "tf-public-us-east-1a" {
  vpc_id            = aws_vpc.tf_project_vpc.id
  cidr_block        = "192.168.64.0/19" #8192
  availability_zone = "us-east-1a"

  tags = {
    Name                         = "public-us-east-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "tf-public-us-east-1b" {
  vpc_id            = aws_vpc.tf_project_vpc.id
  cidr_block        = "192.168.96.0/19" #8192
  availability_zone = "us-east-1b"

  tags = {
    Name                         = "public-us-east-1b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "tf-private-us-east-1b" {
  vpc_id            = aws_vpc.tf_project_vpc.id
  cidr_block        = "192.168.128.0/19" #8192
  availability_zone = "us-east-1b"

  tags = {
    Name                              = "private-us-east-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}
