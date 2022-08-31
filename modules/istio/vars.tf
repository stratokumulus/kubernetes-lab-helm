variable "chart_base_version" {
  description = "Istio base Helm chart version"
  type        = string
  default     = "1.14.3"
}

variable "chart_istiod_version" {
  description = "Istiod Helm chart version"
  type        = string
  default     = "1.14.3"
}

variable "chart_gateway_version" {
  description = "Istio Gateway Helm chart version"
  type        = string
  default     = "1.14.3"
}