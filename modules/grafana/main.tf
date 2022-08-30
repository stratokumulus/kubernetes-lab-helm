# Add Grafana
resource "helm_release" "grafana" {
    name = "grafana"
    repository = "https://grafana.github.io/helm-charts" 
    chart = "grafana"
    timeout = 300
    namespace = "prometheus"    # This depends on prometheus to be installed first, so the NS should already exist

    set {
        name = "service.type"
        value = "LoadBalancer"
    }
    set {
        name = "service.port"
        value = 9080
    }
    set {
        name  = "adminPassword" 
        value = var.grafana_admin_passwd
  }
}