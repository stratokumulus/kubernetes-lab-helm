module "dashboard" {
  source = "./modules/dashboard"
  # No choice, it gets installed by default. 
}
module "longhorn" {
  source = "./modules/longhorn"
  count  = var.enable["longhorn"] ? 1 : 0
}
module "kubeapps" {
  depends_on = [
    module.longhorn
  ]
  source = "./modules/kubeapps"
  count  = var.enable["kubeapps"] ? 1 : 0
}
module "keycloak" {
  depends_on = [
    module.longhorn
  ]
  source = "./modules/keycloak"
  count  = var.enable["keycloak"] ? 1 : 0
  keycloak_admin_passwd = var.keycloak_passwd

}
module "elk" {
  depends_on = [
    module.longhorn
  ]
  source = "./modules/elk"
  count  = var.enable["elk"] ? 1 : 0
}
module "kibana" {
  depends_on = [
    module.elk
  ]
  source = "./modules/kibana"
  count  = var.enable["kibana"] && var.enable["elk"] ? 1 : 0 # No need to install Kibana is ELK is not enabled
}
module "argo" {
  depends_on = [
    module.longhorn
  ]
  source            = "./modules/argo"
  count             = var.enable["argo"] ? 1 : 0
  argo_admin_passwd = var.argo_passwd
}
module "prometheus" {
  depends_on = [
    module.longhorn
  ]
  source = "./modules/prometheus"
  count  = var.enable["prometheus"] ? 1 : 0
}
module "grafana" {
  depends_on = [
    module.prometheus
  ]
  source = "./modules/grafana"
  count  = var.enable["grafana"] && var.enable["prometheus"] ? 1 : 0 # No need to install Grafana is Prometheus is not enabled
  grafana_admin_passwd = var.grafana_passwd
}

# Add Minio - Is it necessary ?
# Add Hashicorp Vault
# Add Velero

# terraform {
#   required_providers {
#     kubectl = {
#       source  = "gavinbunney/kubectl"
#       version = ">= 1.7.0"
#     }
#   }
# }
