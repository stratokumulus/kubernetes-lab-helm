variable "argo_admin_passwd" {
  description = "ArgoCD Admin Passwd"
  type        = string
  sensitive   = true
}

variable "chart_version" {
  description = "ArgoCD Helm chart version"
  type        = string
  default     = "4.0.6"
}