provider "kubernetes" {
  config_path = "./kubeconfig-k3s"
}

provider "helm" {
  kubernetes {
    config_path = "./kubeconfig-k3s"
  }
}
