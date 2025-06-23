resource "aws_route_table" "kiran_public_rt" {
  vpc_id = aws_vpc.kiran_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kiran_igw.id
  }
  tags = { Name = "kiran-public-rt" }
}

resource "aws_route_table_association" "public_rt_assoc" {
  count          = 3
  subnet_id      = aws_subnet.kiran_public[count.index].id
  route_table_id = aws_route_table.kiran_public_rt.id
}
