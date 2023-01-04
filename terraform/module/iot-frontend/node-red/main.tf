resource "kubernetes_deployment_v1" "node_red" {
  metadata {
    name      = "node-red"
    namespace = var.namespace
  }

  spec {
    selector {
      match_labels = {
        app = "node-red"
      }
    }

    template {
      metadata {
        labels = {
          app = "node-red"
        }
      }

      spec {
        volume {
          persistent_volume_claim {
            claim_name = var.pvc_name
          }
        }

        container {
          name  = "node-red"
          image = "nodered/node-red:${var.node_red_version}"

          port {
            container_port = var.port
          }

          volume_mount {
            name       = var.pvc_name
            mount_path = "/data"
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "node_red" {
  metadata {
    name      = "node-red"
    namespace = var.namespace
  }

  spec {
    type = "LoadBalancer"

    selector = {
      app = "node-red"
    }

    port {
      port        = var.port
      target_port = var.port
      protocol    = "TCP"
    }
  }

}

# Ingress for the Node Red dashboard.
resource "kubernetes_ingress_v1" "node_red_dashboard" {
  metadata {
    name      = "node-red-dashboard"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/ingress.class" = "traefik"
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
              name = kubernetes_service_v1.node_red.metadata.0.name
              port {
                number = var.port
              }
            }
          }
        }
      }
    }
  }
}