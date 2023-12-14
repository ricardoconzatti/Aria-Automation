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

##### PROJECT AND CLOUD ZONE #####

variable "project_names" {
  type    = list(string)
  default = ["Project 01", "Project 02"]
}

variable "project_desc" {
  type    = string
  default = ""
}

variable "zone_name" {
  type    = string
  default = "Caverna vCenter 01 - Prod"
}
