##### VMWARE VSPHERE ENVIRONMENT #####
variable "vsphere_server" {
  type    = string
  default = "vcenter@yourdomain"
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

##### VIRTUAL MACHINE #####
variable "vm_name" {
  type    = string
  default = "TF_VM"
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

variable "vm_disk_size" {
   type    = number
   default = 10
}

variable "vm_guestos" {
  type    = string
  default = "other3xLinux64Guest"
}
