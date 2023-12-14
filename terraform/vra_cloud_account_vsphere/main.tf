##### PROVIDER #####
terraform {
  required_providers {
    vra = {
      source = "vmware/vra"
    }
  }
}

##### ENVIRONMENT #####
provider "vra" {
  url           = var.url
  refresh_token = var.refresh_token
  insecure      = var.insecure
}

##### DATA #####
data "vra_region_enumeration_vsphere" "this" {
  hostname                = var.hostname
  username                = var.username
  password                = var.password
  accept_self_signed_cert = true
}

##### #####
resource "vra_cloud_account_vsphere" "this" {
  name        = var.cloud_account_name
  description = var.cloud_account_desc
  hostname    = var.hostname
  username    = var.username
  password    = var.password
  
  regions                      = data.vra_region_enumeration_vsphere.this.regions # it will allow provisioning to all existing vSphere datacenters
  accept_self_signed_cert      = true
}
