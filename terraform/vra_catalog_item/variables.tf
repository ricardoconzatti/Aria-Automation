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
  default = "Ubuntu TF"
}

variable "catalog_item_version" {
  type    = string
  default = "1.0"
}

##### DEPLYOMENT #####

variable "deployment_name" {
  type    = string
  default = "ubuntu terraform"
}

variable "deployment_desc" {
  type    = string
  default = "terraform test"
}

##### INPUTS #####

variable "input_environment" {
  type    = string
  default = "prod"
}

variable "input_service" {
  type    = string
  default = "app"
}

variable "input_os" {
  type    = string
  default = "Ubuntu 22.04"
}

variable "input_instancias" {
  type    = number
  default = 1
}

variable "input_additionaldisk" {
  type = list(object({
    size           = number
    SCSIController = string
  }))
  default = [
    {
      size           = 10
      SCSIController = "SCSI_Controller_1"
    },
	{
      size           = 10
      SCSIController = "SCSI_Controller_1"
    }
  ]
}

##### TIMEOUT #####

variable "timeout_create" {
  type    = string
  default = "30m"
}

variable "timeout_update" {
  type    = string
  default = "30m"
}

variable "timeout_delete" {
  type    = string
  default = "30m"
}
