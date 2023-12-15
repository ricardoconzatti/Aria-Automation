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

##### DATACENTER, CLUSTER AND HOSTS #####
variable "datacenter_name" {
  type    = string
  default = "TF DC"
}

variable "cluster_name" {
  type    = string
  default = "TF CLUSTER"
}

variable "hosts" {
  default = [
    "esxi01.example.com",
    "esxi02.example.com",
    "esxi03.example.com",
  ]
}

variable "drs_enabled" {
  type    = bool
  default = true
}

variable "ha_enabled" {
  type    = bool
  default = true
}

variable "drs_automation_level" {
  type    = string
  default = "fullyAutomated"
}
