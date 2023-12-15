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
data "nsxt_policy_transport_zone" "this" {
  display_name = var.transport_zone_name
}

data "nsxt_policy_tier1_gateway" "this" {
  display_name = var.t1_name
}

##### RESOURCE #####
resource "nsxt_policy_segment" "segment1" {
  display_name        = var.segment_name
  description         = var.segment_desc
  
  transport_zone_path = data.nsxt_policy_transport_zone.this.path
  connectivity_path   = data.nsxt_policy_tier1_gateway.this.path
  
  subnet {
    cidr = var.cidr
  }
}
