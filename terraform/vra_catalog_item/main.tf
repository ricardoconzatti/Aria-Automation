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
data "vra_project" "this" {
  name = var.project_name
}

data "vra_catalog_item" "this" {
  name            = var.catalog_item_name
  expand_versions = true
}

resource "vra_deployment" "this" {
  catalog_item_id      = data.vra_catalog_item.this.id
  catalog_item_version = var.catalog_item_version
  project_id           = data.vra_project.this.id
  
  name        = var.deployment_name
  description = var.deployment_desc
  
  inputs = {
    environment    = var.input_environment
    service        = var.input_service
    os             = var.input_os
    instances      = var.input_instances
    additionaldisk = jsonencode(var.input_additionaldisk)
  }
  
  timeouts {
    create = var.timeout_create
	  update = var.timeout_update
    delete = var.timeout_delete
  }
}
