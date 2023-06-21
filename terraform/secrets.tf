resource "kubernetes_namespace_v1" "onepassword" {
  metadata {
    name = "onepassword"
  }
}

module "onepassword" {
  source    = "./module/service/onepassword"
  namespace = kubernetes_namespace_v1.onepassword.metadata[0].name

  domain = "1password-connect.${var.domain}"
}

data "onepassword_vault" "homelab" {
  # The provider looks up the vault UUID from the vault name and populates `uuid`.
  name = var.onepassword_vault_name
}
