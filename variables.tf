variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "sku_name" {
  default = "B1"
  type = string
  description = "app_service_plan value"
}