# Add Grafana
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "prometheus" # This depends on prometheus to be installed first, so the NS should already exist
  version    = var.chart_version

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "service.port"
    value = 9080
  }
  set {
    name  = "adminPassword"
    value = var.grafana_admin_passwd
  }
}