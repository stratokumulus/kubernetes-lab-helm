variable "chart_version" {
  description = "Dashboard Helm chart version"
  type        = string
  default     = "10.0.1"
}

# variable "initial_repos" {
# #  type = list(map(string))
#   default = {
#     "bitnami" = {url : "https://charts.bitnami.com/bitnami"},
#     "elastic" = { url : "https://helm.elastic.co"},
#   }
# }