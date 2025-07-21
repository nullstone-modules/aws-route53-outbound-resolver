resource "aws_security_group" "this" {
  name        = local.resource_name
  vpc_id      = local.vpc_id
  tags        = local.tags
  description = "Managed by Nullstone"
}

resource "aws_security_group_rule" "this-dns-tcp-from-cidrs" {
  description       = "Allow this VPC to communicate with this nameserver over TCP"
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 53
  to_port           = 53
  cidr_blocks       = [local.vpc_cidr]
}

resource "aws_security_group_rule" "this-dns-udp-from-cidrs" {
  description       = "Allow this VPC to communicate with this nameserver over UDP"
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  protocol          = "udp"
  from_port         = 53
  to_port           = 53
  cidr_blocks       = [local.vpc_cidr]
}

resource "aws_security_group_rule" "this-any-to-world" {
  security_group_id = aws_security_group.this.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}
