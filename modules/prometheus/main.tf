# Add Prometheus
resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "prometheus"
  timeout          = 300
  namespace        = "prometheus"
  create_namespace = true
  version          = var.chart_version

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "server.service.servicePort"
    value = 9999
  }
}
