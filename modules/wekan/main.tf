resource "helm_release" "wekan" {
  name             = "wekan"
  repository       = "https://wekan.github.io/charts"
  chart            = "wekan"
#  namespace        = "wekan"
  version          = var.chart_version
#  create_namespace = true

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "service.port"
    value = 9888
  }
  # set {
  #   name  = "mongodb.replicaSet"
  #   value = 1
  # }
  # set {
  #   name  = "persistence.size"
  #   value = "4Gi

  # }
}