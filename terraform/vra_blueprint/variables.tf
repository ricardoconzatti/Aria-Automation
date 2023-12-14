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

##### PROJECT #####

variable "project_name" {
  type    = string
  default = "Simpson"
}

##### BLUEPRINT #####

variable "blueprint_name" {
  type    = string
  default = "Terraform Test"
}

variable "blueprint_desc" {
  type    = string
  default = "Created by vRA terraform provider"
}
