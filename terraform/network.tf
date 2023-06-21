locals {
  cloudflare_account_id = onepassword_item.cloudflare_provider.section[0].field[0].value
  cloudflare_zone_id    = onepassword_item.cloudflare_provider.section[0].field[1].value
  cloudflare_zone       = "reducer.io"
}

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
resource "cloudflare_tunnel" "homelab" {
  name       = "homelab"
  account_id = onepassword_item.cloudflare_provider.section[0].field[0].value
  secret     = base64encode(onepassword_item.cloudflare_tunnel.password)
}

# Start cloudflared with the tunnel config from above
module "cloudflared" {
  source    = "./module/service/cloudflared"
  namespace = kubernetes_namespace_v1.network.metadata[0].name

  tunnel_id     = cloudflare_tunnel.homelab.id
  tunnel_name   = cloudflare_tunnel.homelab.name
  account_tag   = local.cloudflare_account_id
  tunnel_secret = cloudflare_tunnel.homelab.secret
}

resource "cloudflare_record" "zigbee2mqtt" {
  name    = "z2m"
  type    = "CNAME"
  zone_id = local.cloudflare_zone_id
  value   = "${cloudflare_tunnel.homelab.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_access_application" "home" {
  zone_id              = local.cloudflare_zone_id
  name                 = "Access application for home.${local.cloudflare_zone}"
  domain               = "z2m.${local.cloudflare_zone}"
  session_duration     = "1h"
  type                 = "self_hosted"
  app_launcher_visible = true
}

resource "cloudflare_access_policy" "http_policy" {
  application_id = cloudflare_access_application.home.id
  zone_id        = local.cloudflare_zone_id

  name       = "Example policy for http_app.${local.cloudflare_zone}"
  precedence = 1
  decision   = "allow"
  include {
    email = ["johan@reducer.io"]
  }
}

resource "cloudflare_tunnel_config" "homelab" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_tunnel.homelab.id

  config {
    ingress_rule {
      hostname = "z2m.reducer.io"
      service  = "http://zigbee2mqtt.iot-backend"
    }

    ingress_rule {
      service = "http://192.168.68.66:9002"
    }
  }
}

resource "onepassword_item" "google_oauth" {
  vault    = data.onepassword_vault.homelab.uuid
  category = "password"
  title    = "Google OAuth info"

  # The OAuth client secret is stored in the password field.

  section {
    label = "Settings"

    field {
      label = "OAuth client ID"
    }
  }
}

resource "cloudflare_access_identity_provider" "google" {
  account_id = local.cloudflare_account_id
  name       = "Reducer"
  type       = "google-apps"

  config {
    client_id     = onepassword_item.google_oauth.section[0].field[0].value
    client_secret = onepassword_item.google_oauth.password
    apps_domain   = "reducer.io"
  }
}
