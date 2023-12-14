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

data "vra_region" "this" {
  filter = "name eq '${var.region_name}'"
}

data "vra_fabric_network" "subnet_1" {
  filter = "name eq '${var.subnet_name_1}' and cloudAccountId eq '${data.vra_cloud_account_vsphere.this.id}' and externalRegionId eq '${data.vra_region.this.external_region_id}'"
}

data "vra_fabric_network" "subnet_2" {
  filter = "name eq '${var.subnet_name_2}' and cloudAccountId eq '${data.vra_cloud_account_vsphere.this.id}' and externalRegionId eq '${data.vra_region.this.external_region_id}'"
}

resource "vra_network_profile" "simple" {
  name        = var.network_profile_name
  description = var.network_profile_desc
  region_id   = data.vra_region.this.id

  fabric_network_ids = [
    data.vra_fabric_network.subnet_1.id,
    data.vra_fabric_network.subnet_2.id#,
	#data.vra_fabric_network.subnet_3.id,
	#data.vra_fabric_network.subnet_4.id,
	#data.vra_fabric_network.subnet_5.id,
	#data.vra_fabric_network.subnet_6.id,
	#data.vra_fabric_network.subnet_7.id,
	#data.vra_fabric_network.subnet_8.id
  ]

  isolation_type = "NONE"
}
