resource "helm_release" "cloudflared" {
  name      = "cloudflared"
  namespace = var.namespace

  repository = "https://charts.kubito.dev"
  chart      = "cloudflared"
  version    = "1.0.3"

  # Override cloudflared version in chart
  set {
    name  = "image.tag"
    value = "2023.6.0"
  }

  set {
    name  = "tunnelID"
    value = var.tunnel_id
  }

  set {
    name  = "auth.tunnelName"
    value = var.tunnel_name
  }

  set {
    name  = "auth.tunnelSecret"
    value = var.tunnel_secret
  }

  set {
    name  = "auth.accountTag"
    value = var.account_tag
  }

}
