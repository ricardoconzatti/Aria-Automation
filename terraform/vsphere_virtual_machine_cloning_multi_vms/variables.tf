##### VMWARE VSPHERE ENVIRONMENT #####
variable "vsphere_server" {
  type    = string
  default = "vcenter.yourdomain"
}

variable "username" {
  type    = string
  default = "service-user@yourdomain"
}

variable "password" {
  type      = string
  default   = "SuperSecretPass123"
  sensitive = true
}

variable "allow_unverified_ssl" {
  type    = bool
  default = true
}

##### INFRASTRUCTURE #####
variable "datacenter_name" {
  type    = string
  default = "Caverna Cloud 01"
}

variable "cluster_name" {
  type    = string
  default = "Compute-02"
}

variable "datastore_name" {
  type    = string
  default = "DS-04-TANK-01"
}

variable "network_name" {
  type    = string
  default = "VMnet_111"
}

variable "template_name" {
  type    = string
  default = "Ubuntu 22.04"
}

##### VIRTUAL MACHINES #####
variable "vms" {
  type = map(object({
    vm_name                 = string
    vm_annotation           = string
    vm_cpu                  = number
    vm_memory               = number
    vm_disk_label           = string
    vm_custom_domain        = string
    vm_custom_ip_address    = string
    vm_custom_mask          = number
    vm_custom_ip_gateway    = string
  }))
  default = {
    vm1 = {
      vm_name              = "tf-vm1"
      vm_annotation        = "notes vm1"
      vm_cpu               = 1
      vm_memory            = 1024
      vm_disk_label        = "disk0"
      vm_custom_domain     = "caverna.local"
      vm_custom_ip_address = "192.168.111.201"
      vm_custom_mask       = 24
      vm_custom_ip_gateway = "192.168.111.250"
    },
    vm2 = {
      vm_name              = "tf-vm2"
      vm_annotation        = "notes vm2"
      vm_cpu               = 1
      vm_memory            = 1024
      vm_disk_label        = "disk0"
      vm_custom_domain     = "caverna.local"
      vm_custom_ip_address = "192.168.111.202"
      vm_custom_mask       = 24
      vm_custom_ip_gateway = "192.168.111.250"
    }
  }
}
