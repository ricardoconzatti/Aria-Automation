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

##### VIRTUAL MACHINE #####
variable "vm_name" { # vm name and hostname
  type    = string
  default = "tf-vm01"
}

variable "vm_annotation" {
  type    = string
  default = "vm from terraform"
}

variable "vm_cpu" {
  type    = number
  default = 1
}

variable "vm_memory" {
  type    = number
  default = 1024
}

variable "vm_disk_label" {
   type    = string
   default = "disk0"
}

variable "vm_guestos" {
  type    = string
  default = "other3xLinux64Guest"
}

##### VIRTUAL MACHINE - CUSTOMIZATION #####
variable "vm_custom_domain" {
  type    = string
  default = "caverna.local"
}

variable "vm_custom_ip_address" {
  type    = string
  default = "192.168.111.200"
}

variable "vm_custom_mask" {
  type    = number
  default = 24
}

variable "vm_custom_ip_gateway" {
  type    = string
  default = "192.168.111.250"
}

