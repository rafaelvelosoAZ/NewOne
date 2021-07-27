variable "name" {
  type        = string
  description = "Name of the resource."
  default = ""
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "sku_name" {
  description = "Redis Cache Sku name. Can be Basic, Standard or Premium"
  type        = string
}

variable "enable_non_ssl_port" {
  description = "A map of enable_non_ssl_port"
  type        = bool
}

variable "tags" {
  type    = map(any)
  default = {}
}

