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

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

##### RESOURCE #####
resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.vm_cpu
  memory           = var.vm_memory
  guest_id         = var.vm_guestos
  disk {
    label = var.vm_disk_label
    size  = var.vm_disk_size
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
}
