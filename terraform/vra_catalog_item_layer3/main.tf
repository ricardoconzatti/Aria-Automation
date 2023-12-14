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

##### #####
resource "vra_deployment" "this" {
  catalog_item_id      = data.vra_catalog_item.this.id
  catalog_item_version = var.catalog_item_version
  project_id           = data.vra_project.this.id
  
  name        = var.deployment_name
  description = var.deployment_desc
  
  inputs = {
    # all virtual machines
    vm_environment   = var.vm_environment
	
    # web virtual machines
    vm_web_instances = var.vm_web_instances
    vm_web_cpu       = var.vm_web_cpu
    vm_web_memory    = var.vm_web_memory
	
    # app virtual machines
    vm_app_instances = var.vm_app_instances
    vm_app_cpu       = var.vm_app_cpu
    vm_app_memory    = var.vm_app_memory
	
    # db virtual machines
    vm_db_instances       = var.vm_db_instances
    vm_db_cpu             = var.vm_db_cpu
    vm_db_memory          = var.vm_db_memory
    vm_db_additionaldisks = jsonencode(var.vm_db_additionaldisks)
	
    # web nsx load balancer
    lb_web_port      = var.lb_web_port
    lb_web_protocol  = var.lb_web_protocol
    lb_web_algorithm = var.lb_web_algorithm
  }

  timeouts {
    create = var.timeout_create
    update = var.timeout_update
    delete = var.timeout_delete
  }
}
