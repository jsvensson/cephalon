# Namespace for IOT backend services.
resource "kubernetes_namespace_v1" "iot_backend" {
  metadata {
    name = "iot-backend"
  }
}

module "mosquitto" {
  source    = "./module/iot-backend/mosquitto"
  namespace = kubernetes_namespace_v1.iot_backend.metadata.0.name

  mosquitto_version = "2.0.15"
  mosquitto_conf    = "./data/mosquitto/mosquitto.conf"
}