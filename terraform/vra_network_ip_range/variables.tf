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

variable "cloud_account" {
    type = string
    default = "Caverna vCenter 01"
}

##### NETWORK IP RANGE #####

variable "subnet_name" {
    type = string
    default = "network-123" # CIDR required
}

variable "ip_range_name" {
    type = string
    default = "network-123_range"
}

variable "ip_range_desc" {
    type = string
    default = "network-123_range description"
}

variable "start_ip" {
    type = string
    default =  "192.168.5.100"
}

variable "end_ip" {
    type = string    
    default = "192.168.5.200"
}

variable "ip_version" {
    type = string
    default = "IPv4"
}
