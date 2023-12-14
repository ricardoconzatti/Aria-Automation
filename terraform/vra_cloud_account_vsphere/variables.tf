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

##### CLOUD ACCOUNT #####

variable "cloud_account_name" {
    type = string
    default = "Caverna vCenter 02"
}

variable "cloud_account_desc" {
    type = string
    default = ""
}

variable "hostname" {
    type = string
    default = "vcenter-02.caverna.local"
}

variable "username" {
    type = string
    default = "svc.vra@caverna.local"
}

variable "password" {
    type = string
    default = "SuperSecret123"
    sensitive   = true
}
