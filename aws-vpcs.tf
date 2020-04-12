resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "prj01"
  }

  lifecycle {
    create_before_destroy = false
    prevent_destroy       = false
  }
}

resource "aws_subnet" "prj01-subnet" {
  count      = "${length(var.subnets_count)}"
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${element(var.subnets_count, count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
}
