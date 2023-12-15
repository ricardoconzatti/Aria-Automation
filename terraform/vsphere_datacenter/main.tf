##### PROVIDER #####
terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      #version = "2.6.1"
    }
  }
}

provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.username
  password             = var.password
  allow_unverified_ssl = var.allow_unverified_ssl
}

##### RESOURCE #####
resource "vsphere_datacenter" "prod_datacenter" {
  name = var.datacenter_name
}
