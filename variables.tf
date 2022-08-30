#--------------------
# Workload parameters
#--------------------
variable "argo_passwd" {
  description = "Password for the ArgoCD admin user"
  type        = string
  sensitive   = true # define this in terraform.tfvars
}
variable "grafana_passwd" {
  description = "Password for the grafana admin user"
  type        = string
  sensitive   = true # define this in terraform.tfvars
}
variable "keycloak_passwd" {
  description = "Password for the keycloak admin user"
  type        = string
  sensitive   = true # define this in terraform.tfvars
}

#-------------------------------
# What do we enable today ? 
# Format is "module name" = bool
#-------------------------------

variable "enable" {
  type = map(any)
  default = {
    "argo"       = true,
    "kubeapps"   = true,
    "keycloak"   = true,
    "elk"        = true,
    "kibana"     = true,
    "prometheus" = true,
    "grafana"    = true,
    "longhorn"   = true
  }
}