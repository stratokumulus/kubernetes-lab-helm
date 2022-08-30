resource "helm_release" "argocd" {
  name             = "argo"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "argo-cd"
  timeout          = 300
  namespace        = "argo"
  create_namespace = true
  version          = var.chart_version

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "server.service.ports.http"
    value = 7080
  }
  set {
    name  = "server.service.ports.https"
    value = 7443
  }
  set {
    name  = "config.secret.argocdServerAdminPassword"
    value = var.argo_admin_passwd
  }
  set {
    name  = "config.secret.argocdServerAdminPasswordMtime"
    value = timestamp()
  }
}

