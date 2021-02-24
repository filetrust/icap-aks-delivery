variable "resource_group" {
  description = "This is a consolidated name based on org, environment, region"
  type        = string
  default 	= "gw-icap-aks-deploy"
}

variable "region" {
  description = "The Azure Region"
  type        = string
  default     = "UKSouth"
}

variable "registry_name" {
  description = "This is a consolidated name based on org, environment, region"
  type        = string
  default     = "GwIcapAcr"
}