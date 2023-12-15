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

##### T1 #####
variable "t0_name" {
  type    = string
  default = "T0-GW-01"
}

variable "edge_cluster_name" {
  type    = string
  default = "nsxedge-cluster"
}
