data "ns_connection" "network" {
  name     = "network"
  contract = "network/aws/vpc"
}

locals {
  vpc_id             = data.ns_connection.network.outputs.vpc_id
  vpc_cidr           = data.ns_connection.network.outputs.vpc_cidr
  private_subnet_ids = data.ns_connection.network.outputs.private_subnet_ids
}
