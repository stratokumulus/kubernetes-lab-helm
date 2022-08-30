resource "helm_release" "keycloak" {
  name             = "keycloak"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "keycloak"
  version          = var.chart_version
  namespace        = "keycloak"
  create_namespace = true

  timeout = 600 # 15 minutes ... as some statefulset can take some time

  set {
    name  = "service.ports.http"
    value = 8180
  }
  set {
    name  = "auth.adminUser"
    value = "admin"
  }
  set {
    name  = "auth.adminPassword"
    value = var.keycloak_admin_passwd
  }
}