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

##### DATACENTER #####
variable "datacenter_name" {
  type    = string
  default = "TF DC"
}
