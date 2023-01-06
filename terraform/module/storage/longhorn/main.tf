resource "helm_release" "longhorn" {
  name      = "longhorn"
  namespace = var.namespace

  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
  version    = var.longhorn_version

  set {
    name  = "image.persistence.defaultClassReplicaCount"
    value = var.default_replicas
  }
}

# Ingress for the Longhorn dashboard.
resource "kubernetes_ingress_v1" "longhorn_dashboard" {
  depends_on = [helm_release.longhorn]

  metadata {
    name      = "longhorn-ingress"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"

      # Hajimari dashboard config
      "hajimari.io/enable"  = true
      "hajimari.io/appName" = "Longhorn"
      "hajimari.io/info"    = "Longhorn dashboard"
      "hajimari.io/group"   = "Kubernetes"
      "hajimari.io/icon"    = "mdi:cow"
    }
  }

  spec {
    rule {
      host = var.dashboard_host

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "longhorn-frontend"
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