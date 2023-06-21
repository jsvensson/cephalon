module "robusta" {
  source    = "./module/service/robusta"
  namespace = kubernetes_namespace_v1.observability.metadata[0].name

  # This is base64-encoded in 1Password. See comment in resource.
  values = base64decode(onepassword_item.robusta.section[0].field[0].value)
}

resource "onepassword_item" "robusta" {
  vault = data.onepassword_vault.homelab.uuid
  title = "Robusta values.yaml"

  section {
    label = "Secrets"

    field {
      # Due to limitations with the 1Password provider, documents (files) are not supported.
      # Kludging it by base64-encoding the file and putting it in this field.
      # https://github.com/1Password/terraform-provider-onepassword/issues/51
      # https://github.com/1Password/connect/issues/11
      label = "values.yaml"
    }
  }
}
