resource "kubernetes_namespace_v1" "network" {
  metadata {
    name = "network"
  }
}

### Cloudflare provider credentials
resource "onepassword_item" "cloudflare_provider" {
  vault = var.onepassword_vault_id

  title    = "Cloudflare provider"
  category = "password"

  section {
    label = "Settings"

    field {
      label = "API token"
    }
  }

}

### Cloudflare Tunnel credentials
# Create 1Password item. Manually populated with the Cloudflare tokens etc.
resource "onepassword_item" "cloudflare_tunnel" {
  vault = var.onepassword_vault_id

  title    = "Cloudflare Tunnel"
  category = "password"

  section {
    label = "Settings"

    field {
      label = "Tunnel ID"
    }

    field {
      label = "Tunnel name"
    }

    field {
      label = "Argo account tag"
    }
  }
}

module "cloudflared" {
  source    = "./module/service/cloudflared"
  namespace = kubernetes_namespace_v1.network.metadata[0].name

  tunnel_id     = onepassword_item.cloudflare_tunnel.section[0].field[0].value
  tunnel_name   = onepassword_item.cloudflare_tunnel.section[0].field[1].value
  account_tag   = onepassword_item.cloudflare_tunnel.section[0].field[2].value
  tunnel_secret = onepassword_item.cloudflare_tunnel.password
}
