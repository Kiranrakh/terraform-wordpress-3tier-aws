provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "kiran_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = { Name = "kiran-vpc" }
}

resource "aws_internet_gateway" "kiran_igw" {
  vpc_id = aws_vpc.kiran_vpc.id
  tags = { Name = "kiran-igw" }
}
