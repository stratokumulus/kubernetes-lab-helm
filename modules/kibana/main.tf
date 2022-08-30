resource "helm_release" "kibana" {
  name       = "kibana"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kibana"
  namespace  = "elk" # Depends on ELK, so NS should already exist
  version    = var.chart_version

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "elasticsearch.hosts[0]"
    value = "elk-elasticsearch"
  }

  set {
    name  = "elasticsearch.port"
    value = "9200"
  }
}