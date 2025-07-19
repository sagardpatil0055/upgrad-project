
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.sagar.id
  tags = {
    Name = "sagar-igw"
  }
}
