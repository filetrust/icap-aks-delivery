# Cluster Variables
variable "resource_group" {
  description = "This is a consolidated name based on org, environment, region"
  type        = string
  default 	  = "gw-icap-aks-file-drop-ukw"
}

variable "region" {
  description = "The Azure Region"
  type        = string
  default     = "UKWEST"
}

variable "cluster_name" {
  description = "This is a consolidated name based on org, environment, region"
  type        = string
  default     = "gw-icap-aks-file-drop"
}

variable "node_name" {
  description = "This is the resource group containing the Azure Key Vault"
  type        = string
  default     = "gwicapnode"
}

# Chart Variables
## FIle-Drop Chart
variable "release_name01" {
  description = "This is the name of the release"
  type        = string
  default 	  = "file-drop"
}

variable "namespace01" {
  description = "This is the name of the namespace"
  type        = string
  default 	  = "icap-file-drop"
}

variable "chart_path01" {
  description = "This is the path to the chart"
  type        = string
  default 	  = "./charts/icap-infrastructure/filedrop"
}

variable "file_drop_dns_name_01" {
  description = "This is the DNS name for the ingress"
  type        = string
  default     = "file-drop.ukwest.cloudapp.azure.com"
}

variable "a_record_02" {
  description = "A record for File-Drop"
  type = string
  default = "file-drop"
}


## Cert-Manager Chart
variable "release_name02" {
  description = "This is the name of the release"
  type        = string
  default 	  = "cert-manager"
}

variable "namespace02" {
  description = "This is the name of the namespace"
  type        = string
  default 	  = "cert-manager"
}

variable "chart_repo02" {
  description = "This is the path to the chart"
  type        = string
  default 	  = "./charts/icap-infrastructure/cert-manager-chart"
}

## Nginx Chart
variable "release_name03" {
  description = "This is the name of the release"
  type        = string
  default 	  = "ingress-nginx"
}

variable "namespace03" {
  description = "This is the name of the namespace"
  type        = string
  default 	  = "ingress-nginx"
}

variable "chart_repo03" {
  description = "This is the path to the chart"
  type        = string
  default 	  = "charts/icap-infrastructure/ingress-nginx"
}

variable "file_drop_ui_port" {
    description = "The file_drop_ui_port"
    type = number
}
