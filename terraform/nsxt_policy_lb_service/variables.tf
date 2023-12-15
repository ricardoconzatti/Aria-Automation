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
  default   = "mySuperSecretPasswd123"
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
variable "t1_name" {
  type    = string
  default = "T1-TERRAFORM"
}

##### LOAD BALANCER #####
variable "lb_name" {
  type    = string
  default = "lb-terraform"
}

variable "lb_desc" {
  type    = string
  default = "terraform provisioned service"
}

variable "lb_size" {
  type    = string
  default = "SMALL"
}

variable "lb_enabled" {
  type    = bool
  default = true
}

variable "lb_log_level" {
  type    = string
  default = "ERROR"
}
