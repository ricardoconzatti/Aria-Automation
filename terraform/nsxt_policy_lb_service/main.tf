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
data "nsxt_policy_tier1_gateway" "this" {
  display_name = var.t1_name
}

##### RESOURCE #####
resource "nsxt_policy_lb_service" "this" {
  display_name      = var.lb_name
  description       = var.lb_desc
  
  connectivity_path = data.nsxt_policy_tier1_gateway.this.path
  size              = var.lb_size
  enabled           = var.lb_enabled
  error_log_level   = var.lb_log_level
}
