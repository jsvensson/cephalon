locals {
  service_name = "onepassword-connect"
}

resource "helm_release" "onepassword" {
  name      = "1password"
  namespace = var.namespace

  repository = "https://1password.github.io/connect-helm-charts/"
  chart      = "connect"
  version    = "1.10.0"

  # Install Kubernetes operator
  # https://github.com/1Password/onepassword-operator
  set {
    name  = "operator.create"
    value = false
  }

  # Credentials are read from a local file during initial setup.
  # This file is stored manually in separate 1Password vault.
  set {
    name = "connect.credentials"

    # TODO: This ends up double-encoded in the secret. Fixed it manually for now.
    value = filebase64("1password-credentials.json")
  }
}

# Create ingress for 1Password Connect, used by Terraform
resource "kubernetes_ingress_v1" "onepassword_connect" {
  metadata {
    name      = "onepassword-connect"
    namespace = var.namespace

    annotations = {
      "kubernetes.io/ingress.class" = "traefik"
    }
  }

  spec {
    rule {
      host = var.domain

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = local.service_name
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }

}
