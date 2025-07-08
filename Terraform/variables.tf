variable "resource_group_name" {
  default     = "AZrg1011"
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  default     = "East US"
  description = "Azure region"
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of the App Service plan"
}

variable "web_app_name" {
  type        = string
  description = "Name of the Azure Web App"
}