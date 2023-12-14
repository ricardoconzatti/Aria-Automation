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
data "vra_cloud_account_vsphere" "this" {
  name = var.cloud_account
}

data "vra_fabric_network" "subnet" {
	filter = "name eq '${var.subnet_name}' and cloudAccountId eq '${data.vra_cloud_account_vsphere.this.id}'"
}

##### RESOURCE #####
resource "vra_network_ip_range" "this" {
  name               = var.ip_range_name
  description        = var.ip_range_desc
  start_ip_address   = var.start_ip
  end_ip_address     = var.end_ip
  ip_version         = var.ip_version
  fabric_network_ids = [data.vra_fabric_network.subnet.id]
}
