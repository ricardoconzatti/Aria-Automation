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

##### RESOURCE #####
data "vra_project" "this" {
  name = var.project_name
}

resource "vra_blueprint" "this" {
  name        = var.blueprint_name
  description = var.blueprint_desc

  project_id = data.vra_project.this.id

  content = <<-EOT
formatVersion: 1
inputs:
  ambiente:
    type: string
    title: Ambiente
    description: Selecione o ambiente para deploy
    #default: prod
    oneOf:
      - title: Produção
        const: prod
      - title: Desenvolvimento
        const: dev
  ambiente2:
    type: string
    title: Ambiente
    description: Selecione o ambiente para deploy
    #default: prod
    oneOf:
      - title: Produção
        const: prod
      - title: Desenvolvimento
        const: dev
  servico:
    type: string
    title: Serviço
    description: Selecione o tipo do servidor
    #default: web
    oneOf:
      - title: Application
        const: app
      - title: Database
        const: db
      - title: Web Server
        const: web
  instancias: # quantidade de instancias
    type: integer
    title: Instâncias
    description: Digite a quantidade de instâncias desejada
    #default: 1
    maximum: 10
    minimum: 1
  so: # sistema operacional da vm (template vSphere / image mapping)
    type: string
    title: Sistema Operacional
    description: Selecione o sistema operacional
    #default: Ubuntu 22.04
    oneOf:
      - title: Ubuntu 22.04
        const: Ubuntu 22.04
  tamanho: # tamanho da instancia (template vSphere / aaa)
    type: string
    title: Tamanho
    description: Selecione o tamanho da instancia
    #default: Small
    oneOf:
      - title: Small
        const: Small
      - title: Medium
        const: Medium
  discoadicional:
    type: array
    title: Discos adicionais
    description: Até 5 discos extra por instância
    minItems: 0
    maxItems: 5
    items:
      type: object
      properties:
        size:
          type: integer
          title: Tamanho do disco (GB)
          minimum: 1
          maximum: 100
        SCSIController:
          type: string
          title: SCSI Controller
          enum:
            - SCSI_Controller_0
            - SCSI_Controller_1
            - SCSI_Controller_2
            - SCSI_Controller_3
resources:
  vm:
    type: Cloud.vSphere.Machine
    properties:
      name: '$${"CAV-" + (input.ambiente == "prod" ? "P" : "D") + "-" + to_upper(input.servico) + "-"}'
      image: $${input.so}
      flavor: $${input.tamanho}
      servico: $${input.servico}
      ambiente: $${input.ambiente}
      deploymentName: $${env.deploymentName}
      projectName: $${env.projectName}
      constraints:
        - tag: $${'environment:' + (input.ambiente)}
        - tag: $${'service:' + (input.servico)}
      networks:
        - network: $${resource.rede.id}
          assignment: static
      attachedDisks: $${map_to_object(slice(resource.disco[*].id, length(input.discoadicional)*count.index, length(input.discoadicional)*(count.index+1)), "source")}
  rede:
    type: Cloud.vSphere.Network
    properties:
      networkType: existing
      constraints:
        - tag: $${'environment:' + (input.ambiente)}
        - tag: $${'service:' + (input.servico)}
  disco:
    type: Cloud.vSphere.Disk
    allocatePerInstance: true
    properties:
      capacityGb: '$${(count.index < length(input.discoadicional) ? input.discoadicional[count.index].size : input.discoadicional[(count.index % length(input.discoadicional))].size)}'
      SCSIController: '$${(count.index < length(input.discoadicional) ? input.discoadicional[count.index].SCSIController : input.discoadicional[(count.index % length(input.discoadicional))].SCSIController)}'
      count: $${length(input.discoadicional) * input.instancias}
  EOT
}

data "vra_blueprint" "this" {
  name = vra_blueprint.this.name

  depends_on = [vra_blueprint.this]
}
