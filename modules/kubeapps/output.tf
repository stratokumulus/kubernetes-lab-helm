output "kubeapps-token" {
  value = base64decode(data.kubernetes_resource.token.object.data.token)
}