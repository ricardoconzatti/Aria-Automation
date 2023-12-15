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


##### DATA #####
data "vsphere_datacenter" "datacenter" {
  name = var.datacenter_name
}

data "vsphere_host" "host" {
  count         = length(var.hosts)
  name          = var.hosts[count.index]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

##### RESOURCE #####
resource "vsphere_compute_cluster" "compute_cluster" {
  name            = var.cluster_name
  datacenter_id   = data.vsphere_datacenter.datacenter.id
  host_system_ids = [data.vsphere_host.host.*.id]

  drs_enabled          = var.drs_enabled
  drs_automation_level = var.drs_automation_level
  ha_enabled           = var.ha_enabled
}
