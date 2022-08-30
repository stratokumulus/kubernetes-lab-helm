output "kubeapps-token" {
  value = module.kubeapps[*].kubeapps-token
}

# output "argo-adming-passwd" {
#   value = module.argo[0].argopasswd
# }