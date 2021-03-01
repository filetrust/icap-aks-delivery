variable "azure_region" {
  description = "The Azure Region"
  type        = string
}

variable "suffix" {
  description = "This is a consolidated name based on org, environment, region"
  type        = string
}

variable "domain" {
  description = "This is a domain of organization"
  type        = string
}

variable "icap_port" {
    description = "The Azure backend vault name"
    type = number
}

variable "icap_tlsport" {
    description = "The Azure backend storage account"
    type = number
}

variable "enable_customer_cert" {
    description = "The Azure backend storage account"
    type = bool
    default = false
}

variable "management_ui_port" {
    description = "The management_ui_port"
    type = number
}

variable "file_drop_ui_port" {
    description = "The file_drop_ui_port"
    type = number
}
