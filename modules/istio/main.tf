resource "helm_release" "istio-base" {
  name             = "istio-base"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "base"
  version          = var.chart_base_version
  namespace        = "istio-system"
  create_namespace = true
}

resource "helm_release" "istiod" {
depends_on = [
  helm_release.istio-base
]
  name             = "istiod"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "istiod"
  version          = var.chart_istiod_version
  namespace        = "istio-system"
  create_namespace = true
}

resource "kubernetes_namespace" "istio-ingress" {
    depends_on = [
        helm_release.istiod
    ]
  metadata {
    labels = {
      istio-injection = "enabled"
    }

    name = "istio-ingress"
  }
}

# This one gave me headache. Thanks to mr EvilGenius (he'll recognize himself) for pointing out why Helm wasn't updating the ports ... 
# https://github.com/helm/helm/issues/5711

resource "helm_release" "istio-gateway" {
    depends_on = [
        kubernetes_namespace.istio-ingress
    ]
  name             = "istio-gateway"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  chart            = "gateway"
  version          = var.chart_gateway_version
  namespace        = "istio-ingress"
  create_namespace = true

  # Need to set the whole array name and port if I want to change http2 and https ports ! See Helm issue above

  set {
    name = "service.ports[0].name"
    value = "status-port"
  }
  set {
    name = "service.ports[0].port"
    value = 15021
  }
  set {
    name = "service.ports[1].name"
    value = "http2"
  }
  set {
    name = "service.ports[1].port"
    value = 7880
  }
  set {
    name = "service.ports[2].name"
    value = "https"
  }
  set {
    name = "service.ports[2].port"
    value = 11443
  }
}


