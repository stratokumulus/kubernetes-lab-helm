resource "helm_release" "kubeapps" {
  name       = "kubeapps"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kubeapps"
  version    = var.chart_version

  set {
    name  = "frontend.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "frontend.service.ports.http"
    value = 8990
  }
}

# Bug in current provider and nodes running 1.24.x. Workaround is to use a manifest instead

# resource "kubernetes_service_account" "kubeapps-operator" {
#   depends_on = [
#     helm_release.kubeapps
#   ]
#   metadata {
#     name = "kubeapps-operator"
#   }
# }

resource "kubernetes_manifest" "kubeapps-operator" {
  depends_on = [
    helm_release.kubeapps
  ]
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "name"      = "kubeapps-operator"
      "namespace" = "default"
    }
  }
}

resource "kubernetes_cluster_role_binding" "kubeapps-operator" {
  depends_on = [
    kubernetes_manifest.kubeapps-operator
  ]
  metadata {
    name = "kubeapps-operator"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "kubeapps-operator"
    namespace = "default"
  }
}

resource "kubernetes_secret" "kubeapps-operator-token" {
  depends_on = [
    kubernetes_cluster_role_binding.kubeapps-operator
  ]
  metadata {
    name      = "kubeapps-operator-token"
    namespace = "default"
    annotations = {
      "kubernetes.io/service-account.name" = "kubeapps-operator"
    }

  }

  type = "kubernetes.io/service-account-token"
}

data "kubernetes_resource" "token" {
  depends_on = [
    kubernetes_cluster_role_binding.kubeapps-operator
  ]
  api_version = "v1"
  kind        = "Secret"

  metadata {
    name      = "kubeapps-operator-token"
    namespace = "default"
  }
}
