resource "helm_release" "grafana" {
  name      = "grafana"
  namespace = var.namespace

  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "6.56.6"

  set {
    name  = "persistence.enabled"
    value = true
  }
}

resource "kubernetes_ingress_v1" "grafana" {
  metadata {
    name      = "grafana-ingress"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"

      # Hajimari dashboard config
      "hajimari.io/enable"  = true
      "hajimari.io/appName" = "Grafana"
      "hajimari.io/info"    = "Grafana dashboard"
      "hajimari.io/group"   = "Observability"
      "hajimari.io/icon"    = "mdi:chart-line"
    }
  }

  spec {
    rule {
      host = var.host

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "grafana"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
