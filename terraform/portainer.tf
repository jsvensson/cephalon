resource "kubernetes_namespace_v1" "portainer" {
  metadata {
    name = "portainer"
  }
}

module "portainer" {
  source    = "./module/service/portainer"
  namespace = kubernetes_namespace_v1.portainer.metadata[0].name
}