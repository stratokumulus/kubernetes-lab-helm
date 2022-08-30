variable "grafana_admin_passwd" {
  description = "Grafana Admin Passwd"
  type        = string
  sensitive   = true
}
variable "chart_version" {
  description = "Grafana Helm chart version"
  type        = string
  default     = "6.34.0"
}