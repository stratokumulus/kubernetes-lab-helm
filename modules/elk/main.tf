resource "helm_release" "elk" {
    name = "elk"
    repository = "https://charts.bitnami.com/bitnami" 
    chart = "elasticsearch"
    version = "19.1.4"
    timeout = 300
    namespace = "elk"
    create_namespace = true
}