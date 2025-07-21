resource "aws_route53_resolver_endpoint" "this" {
  name               = local.resource_name
  direction          = "OUTBOUND"
  security_group_ids = [aws_security_group.this.id]
  tags               = local.tags

  dynamic "ip_address" {
    for_each = toset(local.private_subnet_ids)

    content {
      subnet_id = ip_address.value
    }
  }
}
