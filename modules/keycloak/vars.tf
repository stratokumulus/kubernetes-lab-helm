variable "keycloak_admin_passwd" {
  description = "Keycloak Admin Password"
  type        = string
  sensitive   = true
}
variable "chart_version" {
  description = "Keycloak Helm chart version"
  type        = string
  default     = "9.6.0"
}