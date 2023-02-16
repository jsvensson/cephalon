resource "kubernetes_deployment_v1" "mosquitto" {
  metadata {
    name      = "mosquitto"
    namespace = var.namespace
  }

  spec {
    selector {
      match_labels = {
        app = "mosquitto"
      }
    }

    template {
      metadata {
        labels = {
          app = "mosquitto"
        }
      }

      spec {
        volume {
          name = "mosquitto-config-volume"
          config_map {
            name = kubernetes_config_map_v1.mosquitto_conf.metadata.0.name
          }
        }

        container {
          name  = "mosquitto"
          image = "eclipse-mosquitto:${var.mosquitto_version}"

          port {
            container_port = var.mqtt_port
          }

          volume_mount {
            name       = "mosquitto-config-volume"
            mount_path = "/mosquitto/config"
          }
        }
      }
    }
  }
}

# Create ConfigMap for Mosquitto config file.
resource "kubernetes_config_map_v1" "mosquitto_conf" {
  metadata {
    name      = "mosquitto-config"
    namespace = var.namespace
  }

  data = {
    "mosquitto.conf" = file(var.mosquitto_conf)
  }
}

resource "kubernetes_service_v1" "mosquitto" {
  metadata {
    name      = "mosquitto"
    namespace = var.namespace
  }

  spec {
    type = "LoadBalancer"

    selector = {
      app = "mosquitto"
    }

    port {
      port        = var.mqtt_port
      target_port = var.mqtt_port
      protocol    = "TCP"
    }
  }
}