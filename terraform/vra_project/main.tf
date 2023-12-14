##### PROVIDER #####
terraform {
  required_providers {
    vra = {
      source = "vmware/vra"
    }
  }
}

##### VARIABLES #####
provider "vra" {
  url           = var.url
  refresh_token = var.refresh_token
  insecure      = var.insecure
}

##### DATA #####
data "vra_zone" "this" {
  name = var.zone_name
}

##### #####
resource "vra_project" "this" {
  for_each = toset(var.project_names)
  
  name        = each.key
  description = var.project_desc

  zone_assignments {
    zone_id          = data.vra_zone.this.id
    priority         = 0
    max_instances    = 0
    cpu_limit        = 0
    memory_limit_mb  = 0
    storage_limit_gb = 0
  }

  shared_resources = true

  administrator_roles {
    email = "hello@company.com"
    type = "user"
  }

  #member_roles {
  #  email = "tony-group@vra.local"
  #  type = "group"
  #}

  operation_timeout = 6000

  #machine_naming_template = "$${resource.name}-$${####}"

  placement_policy = "DEFAULT"
}
