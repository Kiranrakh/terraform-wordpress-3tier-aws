resource "aws_subnet" "kiran_public" {
  count                   = 3
  vpc_id                  = aws_vpc.kiran_vpc.id
  cidr_block              = cidrsubnet(var.public_subnet_cidr_base, 4, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = { Name = "kiran-public-subnet-${count.index + 1}" }
}

resource "aws_subnet" "kiran_private" {
  count             = 3
  vpc_id            = aws_vpc.kiran_vpc.id
  cidr_block        = cidrsubnet(var.private_subnet_cidr_base, 4, count.index)
  availability_zone = element(var.azs, count.index)
  tags = { Name = "kiran-private-subnet-${count.index + 1}" }
}
