terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create a VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = "192.0.0.0/16"
}

# create a subnet
resource "aws_subnet" "terraform_subnet1" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "192.0.1.0/24"

  tags = {
    Name = "terraform_subnet1"
  }
}

# create a subnet
resource "aws_subnet" "terraform_subnet2" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "192.0.2.0/24"

  tags = {
    Name = "terraform_subnet2"
  }
}

# create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_igw"
  }
}