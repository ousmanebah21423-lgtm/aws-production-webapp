resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "prod-vpc" }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
}

resource "aws_subnet" "subnet_c" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2c"
}

resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod_vpc.id
}
