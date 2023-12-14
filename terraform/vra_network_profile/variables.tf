##### ARIA AUTOMATION (VRA) ENVIRONMENT #####
variable "url" {
  type    = string
  default = "https://vra.yourdomain"
}

variable "refresh_token" {
  type    = string
  default = "vra-token"
}

variable "insecure" {
  type    = bool
  default = "true"
}

##### CLOUD ACCOUNT AND REGION #####

variable "cloud_account" {
    type = string
    default = "Caverna vCenter 01"
}

variable "region_name" { # vsphere datacenter
    type = string
    default = "Caverna Cloud 01"
}

##### FABRIC VSPHERE NETWORK #####

variable "network_profile_name" {
    type = string
    default = "NP TERRAFORM TEST"
}

variable "network_profile_desc" {
    type = string
    default = "novo network profile"
}

variable "subnet_name_1" {
    type = string
    default = "VMnet_113"
}

variable "subnet_name_2" {
    type = string
    default = "VMnet_114"
}

variable "subnet_name_3" {
    type = string
    default = ""
}

variable "subnet_name_4" {
    type = string
    default = ""
}

variable "subnet_name_5" {
    type = string
    default = ""
}

variable "subnet_name_6" {
    type = string
    default = ""
}

variable "subnet_name_7" {
    type = string
    default = ""
}

variable "subnet_name_8" {
    type = string
    default = ""
}
