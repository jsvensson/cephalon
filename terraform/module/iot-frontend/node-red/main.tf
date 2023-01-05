resource "helm_release" "node_red" {
  name      = "node-red"
  namespace = var.namespace

  repository = "https://schwarzit.github.io/node-red-chart/"
  chart      = "node-red"
  version    = "0.22.1"

  set {
    name  = "persistence.enabled"
    value = true
  }
}

resource "kubernetes_ingress_v1" "node_red_ingress" {
  metadata {
    name      = "node-red-ingress"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"

      # Hajimari dashboard config
      "hajimari.io/enable" = true
      "hajimari.io/info"   = "Node-RED dashboard"
      "hajimari.io/icon"   = "mdi:cow"
    }
  }

  spec {
    rule {
      host = var.ui_host

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "node-red"
              port {
                number = 1880
              }
            }
          }
        }
      }
    }
  }
}