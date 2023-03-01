resource "helm_release" "portainer" {
  name      = "portainer"
  namespace = var.namespace

  repository = "https://portainer.github.io/k8s/"
  chart      = "portainer"

  set {
    name  = "enterpriseEdition.enabled"
    value = true
  }
  set {
    name  = "tls.force"
    value = true
  }
}