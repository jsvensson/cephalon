resource "kubernetes_namespace_v1" "onepassword" {
  metadata {
    name = "onepassword"
  }
}

module "onepassword" {
  source    = "./module/service/onepassword"
  namespace = kubernetes_namespace_v1.onepassword.metadata[0].name
}
