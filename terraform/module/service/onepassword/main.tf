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
    name  = "connect.credentials"
    value = "1password-credentials.json"
  }
}
