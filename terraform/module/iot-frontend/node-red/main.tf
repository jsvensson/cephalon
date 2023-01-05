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
          name = "node-red-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.node_red_data.metadata.0.name
          }
        }

        container {
          name  = "node-red"
          image = "nodered/node-red:${var.node_red_version}"

          port {
            container_port = var.port
          }

          volume_mount {
            name       = "node-red-data"
            mount_path = "/data"
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "node_red_data" {
  metadata {
    name      = "node-red-data-pvc"
    namespace = var.namespace
  }

  spec {
    storage_class_name = "longhorn-single-replica"
    access_modes       = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "500Mi"
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