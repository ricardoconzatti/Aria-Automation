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

##### PROJECT AND CATALOG ITEM #####
variable "project_name" {
  type    = string
  default = "Simpson"
}

variable "catalog_item_name" {
  type    = string
  default = "layer3 demo"
}

variable "catalog_item_version" {
  type    = string
  default = "1.1"
}

##### DEPLYOMENT #####
variable "deployment_name" {
  type    = string
  default = "Conza Tech Project"
}

variable "deployment_desc" {
  type    = string
  default = "Conza Tech Project - app web db"
}

##### INPUTS #####
##### ALL VIRTUAL MACHINES #####
variable "vm_environment" {
  type    = string
  default = "prod" # dev, homolog
}

##### WEB VIRTUAL MACHINES #####
variable "vm_web_instances" {
  type    = number
  default = 2
}

variable "vm_web_cpu" {
  type    = number
  default = 1
}

variable "vm_web_memory" {
  type    = number
  default = 1024
}

##### APP VIRTUAL MACHINES #####
variable "vm_app_instances" {
  type    = number
  default = 1
}

variable "vm_app_cpu" {
  type    = number
  default = 1
}

variable "vm_app_memory" {
  type    = number
  default = 1024
}

##### DB VIRTUAL MACHINES #####
variable "vm_db_instances" {
  type    = number
  default = 1
}

variable "vm_db_cpu" {
  type    = number
  default = 1
}

variable "vm_db_memory" {
  type    = number
  default = 1024
}

variable "vm_db_additionaldisks" {
  type = list(object({
    size           = number
    SCSIController = string
  }))
  default = [
    {
      size           = 10
      SCSIController = "SCSI_Controller_1"
    }
  ]
}

##### NSX LOAD BALANCER WEB #####
variable "lb_web_port" {
  type    = number
  default = 80
}

variable "lb_web_protocol" {
  type    = string
  default = "TCP" # HTTP, HTTPS
}

variable "lb_web_algorithm" {
  type    = string
  default = "ROUND_ROBIN" # LEAST_CONNECTION, IP_HASH, etc
}

##### TIMEOUT #####
variable "timeout_create" {
  type    = string
  default = "30m"
}

##### TIME OUT #####
variable "timeout_update" {
  type    = string
  default = "30m"
}

variable "timeout_delete" {
  type    = string
  default = "30m"
}
