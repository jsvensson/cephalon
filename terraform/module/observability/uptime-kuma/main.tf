resource "kubernetes_deployment_v1" "uptime_kuma" {
  metadata {
    name      = "uptime-kuma"
    namespace = var.namespace
  }

  spec {
    selector {
      match_labels = {
        app = "uptime-kuma"
      }

    }

    template {
      metadata {
        labels = {
          app = "uptime-kuma"
        }
      }

      spec {
        volume {
          name = "uptime-kuma-data-volume"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.uptime_kuma_data_pvc.metadata.0.name
          }
        }

        container {
          name  = "uptime-kuma"
          image = "louislam/uptime-kuma:1.19.4"

          port {
            container_port = 3001
          }

          volume_mount {
            mount_path = "/app/data"
            name       = "uptime-kuma-data-volume"
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "uptime_kuma_data_pvc" {
  metadata {
    name      = "uptime-kuma-data-pvc"
    namespace = var.namespace
  }

  spec {
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    access_modes = ["ReadWriteOnce"]
  }
}

resource "kubernetes_service_v1" "uptime_kuma" {
  metadata {
    name      = "uptime-kuma"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "uptime-kuma"
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 3001
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_ingress_v1" "uptime_kuma" {
  metadata {
    name      = "uptime-kuma-ingress"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"

      # Hajimari dashboard config
      "hajimari.io/enable"  = true
      "hajimari.io/appName" = "Uptime Kuma"
      "hajimari.io/info"    = "Uptime Kuma dashboard"
      "hajimari.io/group"   = "Observability"
      "hajimari.io/icon"    = "mdi:chart-line-variant"
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
              name = "uptime-kuma"
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