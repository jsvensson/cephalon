resource "kubernetes_manifest" "traefik_helmchartconfig" {
  manifest = {
    apiVersion = "helm.cattle.io/v1"
    kind       = "HelmChartConfig"

    metadata = {
      name      = "traefik"
      namespace = "kube-system"
    }

    spec = {
      "valuesContent" = <<-EOT
      additionalArguments:
        - "--api"
        - "--api.dashboard=true"
        - "--api.insecure=true"
        - "--log.level=DEBUG"
      ports:
        traefik:
          expose: true
      providers:
        kubernetesCRD:
          allowCrossNamespace: true
      EOT
    }
  }
}

# Ingress for the Traefik dashboard, pointing to the k3s Traefik service.
resource "kubernetes_ingress_v1" "traefik_dashboard" {
  metadata {
    name      = "traefik-ingress"
    namespace = "kube-system"

    annotations = {
      "kubernetes.io/ingress.class" = "traefik"

      # Hajimari dashboard config
      "hajimari.io/enable"  = true
      "hajimari.io/appName" = "Traefik"
      "hajimari.io/info"    = "Traefik dashboard"
      "hajimari.io/group"   = "Kubernetes"
      "hajimari.io/icon"    = "mdi:traffic-light"
    }
  }

  spec {
    rule {
      host = "traefik.cortex.reducer.io"

      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "traefik"
              port {
                number = 9000
              }
            }
          }
        }
      }
    }
  }
}