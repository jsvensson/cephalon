resource "helm_release" "n8n" {
  name      = "n8n"
  namespace = var.namespace

  repository = "https://8gears.container-registry.com/chartrepo/library/"
  chart      = "n8n"
  version    = "0.7.0"
}