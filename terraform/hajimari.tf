resource "helm_release" "hajimari" {
  name      = "hajimari"
  namespace = kubernetes_namespace_v1.iot_frontend.metadata[0].name

  repository = "https://hajimari.io"
  chart      = "hajimari"

  set {
    name  = "defaultEnable"
    value = true
  }

  # Fix PVC write access issue, see https://github.com/toboshii/hajimari/issues/74
  set {
    name  = "podSecurityContext.fsGroup"
    value = 101
  }
  set {
    name  = "podSecurityContext.fsGroupChangePolicy"
    value = "OnRootMismatch"
  }

}

resource "kubernetes_ingress_v1" "hajimari" {
  metadata {
    name      = "hajimari"
    namespace = kubernetes_namespace_v1.iot_frontend.metadata[0].name
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"
    }
  }

  spec {
    rule {
      host = "home.${var.domain}"

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "hajimari"
              port {
                number = 3000
              }
            }
          }
        }
      }
    }
  }
}