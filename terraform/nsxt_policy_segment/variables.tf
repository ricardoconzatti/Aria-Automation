##### VMWARE NSX-T ENVIRONMENT #####
variable "host" {
  type    = string
  default = "nsx.caverna.local"
}

variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type      = string
  default   = "mySuperSecretPass123"
  sensitive = true
}

variable "allow_unverified_ssl" {
  type    = bool
  default = true
}

variable "max_retries" {
  type    = string
  default = 2
}

##### T1 & TRANSPORT ZONE #####
variable "t1_name" {
  type    = string
  default = "T1-TERRAFORM"
}

variable "transport_zone_name" {
  type    = string
  default = "CAV-TZ-OVERLAY"
}

##### SEGMENT #####
variable "segment_name" {
  type    = string
  default = "segment-tf"
}

variable "segment_desc" {
  type    = string
  default = "terraform provisioned segment"
}

variable "cidr" {
  type    = string
  default = "12.12.2.1/24"
}
