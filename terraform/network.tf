resource "kubernetes_namespace_v1" "network" {
  metadata {
    name = "network"
  }
}

### Cloudflare provider credentials. Password is the API token from Cloudflare.
resource "onepassword_item" "cloudflare_provider" {
  vault = data.onepassword_vault.homelab.uuid

  title    = "Cloudflare provider"
  category = "password"
  tags = [
    "cloudflare",
  ]

  section {
    label = "Settings"

    field {
      label = "Account ID"
    }

    field {
      label = "Zone ID"
    }
  }
}

### Cloudflare Tunnel credentials
# Create 1Password item. Manually populated with the tunnel token.
resource "onepassword_item" "cloudflare_tunnel" {
  vault = data.onepassword_vault.homelab.uuid

  title    = "Cloudflare Tunnel"
  category = "password"
  tags = [
    "cloudflare",
  ]
}

# Create tunnel
resource "cloudflare_tunnel" "homelab_tunnel" {
  name       = "homelab"
  account_id = onepassword_item.cloudflare_provider.section[0].field[0].value
  secret     = base64encode(onepassword_item.cloudflare_tunnel.password)
}

# Start cloudflared with the tunnel config from above
module "cloudflared" {
  source    = "./module/service/cloudflared"
  namespace = kubernetes_namespace_v1.network.metadata[0].name

  tunnel_id     = cloudflare_tunnel.homelab_tunnel.id
  tunnel_name   = cloudflare_tunnel.homelab_tunnel.name
  account_tag   = onepassword_item.cloudflare_provider.section[0].field[0].value
  tunnel_secret = cloudflare_tunnel.homelab_tunnel.secret
}
