##### PROVIDER #####
terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
	    #version = "3.3.2"
    }
  }
}

##### VARIABLES #####
provider "nsxt" {
  host                 = var.host
  username             = var.username
  password             = var.password
  max_retries          = var.max_retries
  allow_unverified_ssl = var.allow_unverified_ssl
}

##### DATA #####
data "nsxt_policy_tier0_gateway" "T0" {
  display_name = var.t0_name
}

data "nsxt_policy_edge_cluster" "EC" {
  display_name = var.edge_cluster_name
}

##### RESOURCE #####
resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  display_name              = "T1-TERRAFORM"
  description               = "Tier-1 provisioned by Terraform"
  nsx_id                    = "predefined_id"
  edge_cluster_path         = data.nsxt_policy_edge_cluster.EC.path
  failover_mode             = "PREEMPTIVE"
  default_rule_logging      = "false"
  enable_firewall           = "true"
  enable_standby_relocation = "false"
  tier0_path                = data.nsxt_policy_tier0_gateway.T0.path
  route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED"]
  pool_allocation           = "ROUTING"

  #route_advertisement_rule {
  #  name                      = "rule1"
  #  action                    = "DENY"
  #  subnets                   = ["20.0.0.0/24", "21.0.0.0/24"]
  #  prefix_operator           = "GE"
  #  route_advertisement_types = ["TIER1_CONNECTED"]
  #}
}
